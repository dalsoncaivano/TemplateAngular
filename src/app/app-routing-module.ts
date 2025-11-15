import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './features/home/home.component';
import { EquipeComponent } from './features/sobre/equipe/equipe.component';
import { TemplateCardsComponent } from './features/componentes/template-cards/template-cards.component';
import { TemplateButtonsComponent } from './features/componentes/template-buttons/template-buttons.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'componentes/cards/templates', component: TemplateCardsComponent },
  { path: 'componentes/botoes/templates', component: TemplateButtonsComponent },
  { path: 'sobre/equipe', component: EquipeComponent },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
