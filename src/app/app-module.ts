import { HttpClientModule } from '@angular/common/http';
import { NgModule, provideBrowserGlobalErrorListeners } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { DividerModule } from 'primeng/divider';
import { GalleriaModule } from 'primeng/galleria';
import { MenubarModule } from 'primeng/menubar';
import { TieredMenuModule } from 'primeng/tieredmenu';
import { ToggleButtonModule } from 'primeng/togglebutton';
import { ToolbarModule } from 'primeng/toolbar';
import { TableModule } from 'primeng/table';
import { PaginatorModule } from 'primeng/paginator';
import { OrganizationChartModule } from 'primeng/organizationchart';

import { AppRoutingModule } from './app-routing-module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './layout/header/header.component';
import { HomeComponent } from './features/home/home.component';
import { BannerComponent } from './shared/banner/banner.component';
import { EquipeComponent } from './features/sobre/equipe/equipe.component';
import { TemplateCardsComponent } from './features/componentes/template-cards/template-cards.component';
import { TemplateButtonsComponent } from './features/componentes/template-buttons/template-buttons.component';
import { TemplateTableComponent } from './features/componentes/template-table/template-table.component';
import { OrgchartComponent } from './features/componentes/orgchart/orgchart.component';
import { CursosComponent } from './features/cursos/cursos.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    HomeComponent,
    BannerComponent,
    EquipeComponent,
    TemplateCardsComponent,
    TemplateButtonsComponent,
    TemplateTableComponent,
    OrgchartComponent,
    CursosComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    FormsModule,
    ToolbarModule,
    MenubarModule,
    TieredMenuModule,
    ToggleButtonModule,
    GalleriaModule,
    CardModule,
    ButtonModule,
    DividerModule,
    TableModule,
    PaginatorModule,
    OrganizationChartModule,
    AppRoutingModule
  ],
  providers: [
    provideBrowserGlobalErrorListeners()
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
