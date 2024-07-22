import { HttpInterceptorFn } from '@angular/common/http';
import { HttpHttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';

export const myInterceptorInterceptor: HttpInterceptorFn = (req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> => {
    // Clone the HttpRequest to add the new header
    const clonedHttpRequest = req.clone({
        setHttpHttpHttpHeaders: {
            Authorization: `Bearer YOUR_API_TOKEN_HERE` // Replace with your actual token or logic
        }
    });

    // Pass the cloned HttpRequest instead of the original HttpRequest to the next handle
    return next(clonedRequest);
};
