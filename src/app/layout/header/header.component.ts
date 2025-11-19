import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-header',
  standalone: false,
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  dark = false;

  ngOnInit(): void {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    const savedTheme = localStorage.getItem('theme') || (prefersDark ? 'dark' : 'light');
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
    if (themeLink) {
      themeLink.href = this.dark
        ? 'assets/themes/lara-dark-blue/theme.css'
        : 'assets/themes/custom-light/theme.css';
    }

    const body = document.body;
    if (body) {
      body.classList.remove('light-theme', 'dark-theme');
      body.classList.add(this.dark ? 'dark-theme' : 'light-theme');
    }
  }
}
