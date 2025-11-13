import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './features/home/home.component';
import { EquipeComponent } from './features/sobre/equipe/equipe.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'sobre/equipe', component: EquipeComponent },
  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
