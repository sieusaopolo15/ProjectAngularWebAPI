import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { catchError, timeout } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class HttpService {

  constructor(private http: HttpClient) { }

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'X-Custom-Header',
      'Authorization': `Bearer ${sessionStorage.getItem('employee-token')}`
    })
  };

  formDataOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'multipart/form-data',
      'Accept': 'multipart/form-data',
      'Access-Control-Allow-Headers': 'Content-Type',
    })
  }

  handleError<T>(): any {
    return (error: any): Observable<any> => {
      console.error(error);
      if (error.name === 'TimeoutError') {
        return of({
          error_code: 'time_out',
          error_message:
            'Kết nối mạng không ổn định, vui lòng kiểm tra lại đường truyền.',
          success: false,
        });
      }

      return of(null);
    };
  }

  get(url: string, type: string){
    let str = url + type;
    return this.http.get(str, this.httpOptions).pipe(timeout(60000), catchError(this.handleError()));
  }

  getChart(url: string, type: string): Observable<[]>{
    let str = url + type;
    return this.http.get(str, this.httpOptions).pipe(timeout(60000), catchError(this.handleError()));
  }

  post(url: string, type: string, data) {
    let str = url + type;
    return this.http.post<any>(str, data, this.httpOptions);
  }

  formDataPost(url: string, type: string, data) {
    let str = url + type;
    return this.http.post(str, data, this.formDataOptions);
  }

  put(url: string, type: string, data) {
    let str = url + type;
    return this.http.put(str, data, this.httpOptions);
  }
}
