import { Component } from '@angular/core';

interface Product {
  code: string;
  name: string;
  category: string;
  quantity: number;
}

@Component({
  selector: 'app-template-table',
  standalone: false,
  templateUrl: './template-table.component.html',
  styleUrls: ['./template-table.component.scss']
})
export class TemplateTableComponent {
  products: Product[] = [
    { code: 'f230fh0g3', name: 'Bamboo Watch', category: 'Accessories', quantity: 24 },
    { code: 'nvklal433', name: 'Black Watch', category: 'Accessories', quantity: 61 },
    { code: 'zz21cz3c1', name: 'Blue Band', category: 'Fitness', quantity: 2 },
    { code: '244wgerg2', name: 'Blue T-Shirt', category: 'Clothing', quantity: 25 },
    { code: 'h456wer53', name: 'Bracelet', category: 'Accessories', quantity: 73 },
    { code: 'av2231fwg', name: 'Brown Purse', category: 'Accessories', quantity: 0 }
  ];
}
