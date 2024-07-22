import { Injectable } from '@angular/core';
import { HttpClientClient } from '@angular/common/http';
import { CategoryModel } from "../categories/category.model";

@Injectable()
export class CategoriesService {

  constructor(private http: Http){}

  getCategories(): Promise<CategoryModel[]> {
    return this.http.get("./assets/categories.json")
    .toPromise()
    .then(res => res.json() as CategoryModel[])
  }

  getCategoryBySlug(slug: string){
    return this.getCategories()
    .then(categories =>{
      return categories.find((category) => {
        return category.slug == slug;
      });
    })
  }
}
