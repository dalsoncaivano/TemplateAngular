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
        label: 'Cursos',
        routerLink: '/cursos'
      },
      {
        label: 'Componentes',
        items: [
          { label: 'Cards', routerLink: '/componentes/cards/templates' },
          { label: 'Botões', routerLink: '/componentes/botoes/templates' },
          { label: 'Organograma', routerLink: '/componentes/orgchart' },
          { label: 'Tables', routerLink: '/componentes/tables/templates' }
        ]
      },
      {
        label: 'Sobre',
        items: [{ label: 'A equipe', routerLink: '/sobre/equipe' }]
      }
    ];

    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    const savedTheme = localStorage.getItem('theme') || (prefersDark ? 'dark' : 'light');
    this.dark = savedTheme === 'dark';
    this.applyTheme();
  }

  toggleTheme(): void {
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
