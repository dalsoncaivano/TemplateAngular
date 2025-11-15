import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './features/home/home.component';
import { EquipeComponent } from './features/sobre/equipe/equipe.component';
import { TemplateCardsComponent } from './features/componentes/template-cards/template-cards.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'componentes/cards/templates', component: TemplateCardsComponent },
  { path: 'sobre/equipe', component: EquipeComponent },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
