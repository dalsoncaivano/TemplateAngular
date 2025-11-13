import { Component, OnInit } from '@angular/core';
import { MenuItem } from 'primeng/api';

@Component({
  selector: 'app-header',
  standalone: false,
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  items: MenuItem[] = [];
  dark = false;

  ngOnInit(): void {
    this.items = [
      {
        label: 'Sobre',
        items: [{ label: 'A equipe', routerLink: '/sobre/equipe' }]
      }
    ];

    const savedTheme = localStorage.getItem('theme') || 'light';
    this.dark = savedTheme === 'dark';
    this.applyTheme();
  }

  toggleTheme(): void {
    this.dark = !this.dark;
    localStorage.setItem('theme', this.dark ? 'dark' : 'light');
    this.applyTheme();
  }

  private applyTheme(): void {
    if (typeof document === 'undefined') {
      return;
    }

    const themeLink = document.getElementById('app-theme') as HTMLLinkElement | null;
    if (!themeLink) {
      return;
    }

    themeLink.href = this.dark
      ? 'assets/themes/lara-dark-blue/theme.css'
      : 'assets/themes/lara-light-blue/theme.css';
  }
}
