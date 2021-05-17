﻿using BuildingMaterialShop.ApiModels.EmployeeViewModel;
using BuildingMaterialShop.Auth;
using BuildingMaterialShop.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace BuildingMaterialShop.Controllers
{
    [Route("[controller]")]
    [Authorize]
    [ApiController]

    public class EmployeesController : ControllerBase
    {
        private readonly BuildingMaterialsShopContext _context;
        private readonly JWTSettings _jwtsettings;

        public EmployeesController(IOptions<JWTSettings> jwtsetting, BuildingMaterialsShopContext context)
        {
            _context = context;
            _jwtsettings = jwtsetting.Value;
        }

        [AllowAnonymous]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Employee>>> GetEmployees()
        {

            var employees = await _context.Employees.Where(e => e.RoleId != "ADMIN").Include(employee => employee.Role).ToListAsync();
            return employees;
        }

        [AllowAnonymous]
        [HttpGet("{employeeId}")]
        public async Task<ActionResult<Employee>> GetEmployeeInfo(int employeeId)
        {
            var employee = await _context.Employees.SingleAsync(employee => employee.EmployeeId == employeeId);

            _context.Entry(employee)
                .Reference(emp => emp.Role)
                .Load();


            if (employee == null)
            {
                return NotFound();
            }

            employee.PassWord = null;

            return employee;
        }
        [AllowAnonymous]
        [HttpPost("ChangePassword")]
        public async Task<IActionResult> ChangePassword(EmployeeChangePasswordViewModel model)
        {
            //var handler = new JwtSecurityTokenHandler();
            //string authHeader = Request.Headers["Authorization"];
            //authHeader = authHeader.Replace("Bearer ", "");
            //var jsonToken = handler.ReadToken(authHeader);
            //var tokenS = handler.ReadToken(authHeader) as JwtSecurityToken;
            //var id = tokenS.Claims.First(claim => claim.Type == " ").Value;

            //if (id != model.EmployeeId.ToString())
            //{
            //    return Unauthorized();
            //}

            if (!EmployeeExists(model.EmployeeId))
            {
                return BadRequest();
            }
            var employee = _context.Employees.FirstOrDefault(e => e.EmployeeId == model.EmployeeId && e.PassWord == Auth.MD5.CreateMD5(model.OldPassword));

            if (employee == null)
            {

                return Ok("Mật khẩu không chính xác.");
            }

            if (string.IsNullOrEmpty(model.NewPassword) || model.NewPassword.Contains(' ') || model.NewPassword.Length < 6)
            {
                return Ok("Mật khẩu mới không hợp lệ.");
            }


            if (model.NewPassword.Equals(model.OldPassword))
            {
                return Ok("Mật khẩu mới không được giống với mật khẩu cũ.");
            }
            if (!model.NewPassword.Equals(model.ConfirmPassword))
            {
                return Ok("Mật khẩu mới không trùng khớp.");
            }

            employee.PassWord = Auth.MD5.CreateMD5(model.NewPassword);

            _context.Entry(employee).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Ok("Đổi mật khẩu thất bại.");
            }

            return Ok("Đổi mật khẩu thành công.");

        }

        [AllowAnonymous]
        [HttpPost("Register")]
        public async Task<ActionResult<EmployeeViewModel>> Register([FromBody] EmployeeRegisterViewModel employeeRegister)
        {

            if (employeeRegister.Email == null || employeeRegister.Email.Length < 10)
            {
                return Ok("Email không hợp lệ.");
            }

            if (EmailCustomerExists(employeeRegister.Email) || EmailEmployeeExists(employeeRegister.Email))
            {
                return Ok("Email đã tồn tại.");
            }
            if (employeeRegister.PassWord == null || employeeRegister.PassWord.Length < 6)
            {
                return Ok("Mật khẩu không hợp lệ.");
            }
            var role = _context.Roles.Find(employeeRegister.RoleId);
            if (role == null)
            {
                return Ok("Chức vụ không hợp lệ.");
            }


            var employee = employeeRegister.ToEmployee();

            _context.Employees.Add(employee);

            try
            {
                await _context.SaveChangesAsync();

            }
            catch (Exception e)
            {

                return Ok("Thêm nhân viên thất bại.");
            }

            employee.PassWord = null;
            return CreatedAtAction("GetEmployeeInfo", new { employeeId = employee.EmployeeId }, employee);

        }
        [AllowAnonymous]
        [HttpPost("Login")]
        public async Task<ActionResult<EmployeeViewModel>> Login([FromBody] EmployeeLoginViewModel employeeLoginViewModel)
        {
            if (string.IsNullOrEmpty(employeeLoginViewModel.Email) || string.IsNullOrEmpty(employeeLoginViewModel.PassWord))
            {
                return Ok("Email hoặc mật khẩu không chính xác.");
            }


            var employee = await _context.Employees
                                .Where(u => u.Email == employeeLoginViewModel.Email
                                && u.PassWord == Auth.MD5.CreateMD5(employeeLoginViewModel.PassWord))
                                .FirstOrDefaultAsync();
            if (employee == null)
            {
                return Ok("Email hoặc mật khẩu không chính xác.");
            }
            if (employee.IsBlocked)
            {
                return Ok("Tài khoản đang tạm khóa.");
            }
            EmployeeViewModel employeeViewModel = null;

            if (employee != null)
            {
                RefreshTokenEmployee refreshToken = GenerateRefreshToken();
                employee.RefreshTokenEmployees.Add(refreshToken);
                await _context.SaveChangesAsync();

                employeeViewModel = new EmployeeViewModel(employee);
                employeeViewModel.RefreshToken = refreshToken.Token;
            }


            

            //sign token here
            employeeViewModel.AccessToken = GenerateAccessToken(employee.EmployeeId);

            return employeeViewModel;
        }
        [AllowAnonymous]
        [HttpPost("Block")]
        public ActionResult Block([FromBody] int employeeId)
        {
            if (!EmployeeExists(employeeId))
                return NotFound();

            var employee = _context.Employees.Find(employeeId);
            if (!employee.IsBlocked)
            {
                employee.IsBlocked = true;
            }
            else
            {
                return Ok("Nhân viên đã bị khóa rồi.");
            }
            try
            {
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                return Ok("Khóa nhân viên không thành công.");

            }

            return Ok("Khóa nhân viên thành công.");

        }
        [AllowAnonymous]
        [HttpPost("UnBlock")]
        public async Task<ActionResult> UnBlock([FromBody] int employeeId)
        {
            if (!EmployeeExists(employeeId))
                return NotFound();

            var employee = _context.Employees.Find(employeeId);

            if (employee.IsBlocked)
            {
                employee.IsBlocked = false;
            }
            else
            {
                return Ok("Nhân viên chưa bị khóa");
            }

            try
            {
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                return Ok("Mở khóa nhân viên không thành công.");

            }

            return Ok("Mở khóa nhân viên thành công.");

        }
        [AllowAnonymous]
        [HttpPost("ChangeInfo/{employeeId}")]
        public async Task<IActionResult> PutCustomer(int employeeId, [FromBody] Employee employee)
        {

            if (employeeId != employee.EmployeeId)
            {
                return BadRequest();
            }
            if (!EmployeeExists(employeeId))
            {
                return NotFound();
            }
            var _employee = await _context.Employees.FindAsync(employeeId);
            _employee.Address = employee.Address;
            _employee.BirthDay = employee.BirthDay;
            _employee.FullName = employee.FullName;
            _employee.Gender = employee.Gender;
            _employee.PhoneNumber = employee.PhoneNumber;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmployeeExists(employeeId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        [AllowAnonymous]
        [HttpPost("RefreshToken")]
        public async Task<ActionResult<EmployeeViewModel>> RefreshToken([FromBody] RefreshRequest refreshRequest)
        {
            Employee employee = GetUserFromAccessToken(refreshRequest.AccessToken);

            if (employee != null && ValidateRefresh(employee, refreshRequest.RefreshToken))
            {
                EmployeeViewModel employeeViewModel = new EmployeeViewModel(employee);
                employeeViewModel.AccessToken = GenerateAccessToken(employee.EmployeeId);


                return employeeViewModel;
            }

            return null;
        }

        private bool ValidateRefresh(Employee Employee, string refreshToken)
        {

            RefreshTokenEmployee refreshTokenEmployee = _context.RefreshTokenEmployees.Where(rt => rt.Token == refreshToken)
                                        .OrderByDescending(rt => rt.ExpiryDate)
                                        .FirstOrDefault();
            if (refreshTokenEmployee != null && refreshTokenEmployee.EmployeeId == Employee.EmployeeId
                && refreshTokenEmployee.ExpiryDate > DateTime.UtcNow)
            {
                return true;
            }
            return false;
        }

        private Employee GetUserFromAccessToken(string accessToken)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_jwtsettings.SecretKey);

            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = false,
                ValidateAudience = false,
                ClockSkew = TimeSpan.Zero,
                ValidateLifetime = false
            };

            SecurityToken securityToken;
            var principle = tokenHandler.ValidateToken(accessToken, tokenValidationParameters, out securityToken);

            JwtSecurityToken jwtSecurityToken = securityToken as JwtSecurityToken;

            if (jwtSecurityToken != null && jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
            {
                var employeeId = principle.FindFirst(ClaimTypes.Name)?.Value;

                return _context.Employees.Where(c => c.EmployeeId == Convert.ToInt32(employeeId)).FirstOrDefault();
            }
            return null;
        }

        private string GenerateAccessToken(int employeeId)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_jwtsettings.SecretKey);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name,Convert.ToString(employeeId))
                }),
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key),
                SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        private RefreshTokenEmployee GenerateRefreshToken()
        {
            RefreshTokenEmployee refreshToken = new RefreshTokenEmployee();
            var randomNumber = new byte[32];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(randomNumber);
                refreshToken.Token = Convert.ToBase64String(randomNumber);
            }
            refreshToken.ExpiryDate = DateTime.UtcNow.AddDays(1);

            return refreshToken;

        }
        private bool EmployeeExists(int id)
        {
            return _context.Employees.Any(e => e.EmployeeId == id);
        }

        private bool EmailCustomerExists(string email)
        {
            return _context.Customers.Any(e => e.Email == email);
        }
        private bool EmailEmployeeExists(string email)
        {
            return _context.Employees.Any(e => e.Email == email);
        }
        private string GetEmployeePassword(int id)
        {
            return _context.Employees.Find(id).PassWord;
        }

    }
}
