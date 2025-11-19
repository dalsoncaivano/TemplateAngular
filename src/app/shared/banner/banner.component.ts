import { Component, OnInit } from '@angular/core';

interface Photo {
  itemImageSrc: string;
  alt?: string;
  title?: string;
}

@Component({
  selector: 'app-banner',
  standalone: false,
  templateUrl: './banner.component.html',
  styleUrls: ['./banner.component.scss']
})
export class BannerComponent implements OnInit {
  images: Photo[] = [];

  ngOnInit(): void {
    this.images = [
      { itemImageSrc: 'assets/images/banner1.jpg', title: 'Destaque 1' },
      { itemImageSrc: 'assets/images/banner2.jpg', title: 'Destaque 2' },
      { itemImageSrc: 'assets/images/banner3.jpg', title: 'Destaque 3' },
      { itemImageSrc: 'assets/images/banner4.jpg', title: 'Destaque 4' }
    ];
  }
}
