import { Component, OnDestroy, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  standalone: false,
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, OnDestroy {
  ngOnInit(): void {
    document.querySelector('.page-body')?.classList.add('page-body--flush');
  }

  ngOnDestroy(): void {
    document.querySelector('.page-body')?.classList.remove('page-body--flush');
  }
}
