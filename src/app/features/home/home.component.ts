import { Component, OnDestroy, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  standalone: false,
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit, OnDestroy {
  readonly cards = [
    {
      icon: 'pi pi-book',
      title: 'Formato dos cursos',
      subtitle: 'Diferencial Foursys',
      description:
        'Os cursos foram elaborados para promover uma evolucao gradual: partem do entendimento sintatico e semantico da linguagem e avancam ate a construcao de mini projetos, nos quais o aluno aprende a identificar e resolver os problemas apresentados de forma pratica.'
    },
    {
      icon: 'pi pi-briefcase',
      title: 'Instrutores',
      subtitle: 'A equipe',
      description:
        'O time de instrutores foi cuidadosamente selecionado, reunindo solida experiencia profissional e consistente formacao academica. Essa combinacao garante a capacidade de identificar eventuais lacunas de aprendizado e corrigi las de forma precisa e oportuna.'
    },
    {
      icon: 'pi pi-users',
      title: 'Processo seletivo',
      subtitle: 'Turmas homogêneas',
      description:
        'Para garantir que todos tenham a mesma base de aprendizado, a matricula no curso inclui uma prova inicial com questoes de interpretacao de textos em portugues, ingles e raciocinio logico. Esse processo ajuda a confirmar que voce esta pronto para a jornada e a manter a turma homogenea, favorecendo o desenvolvimento de todos.'
    }
  ];

  ngOnInit(): void {
    document.querySelector('.page-body')?.classList.add('page-body--flush');
  }

  ngOnDestroy(): void {
    document.querySelector('.page-body')?.classList.remove('page-body--flush');
  }
}
