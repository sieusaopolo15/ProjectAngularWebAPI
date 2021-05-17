﻿using System;
using System.Collections.Generic;

#nullable disable

namespace BuildingMaterialShop.Models
{
    public partial class OrderDetail
    {
        public int? Quantity { get; set; }
        public int OrderId { get; set; }
        public string ProductId { get; set; }

        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
