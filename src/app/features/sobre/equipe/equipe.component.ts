import { Component, OnInit } from '@angular/core';
import { TreeNode } from 'primeng/api';

@Component({
  selector: 'app-equipe',
  standalone: false,
  templateUrl: './equipe.component.html',
  styleUrls: ['./equipe.component.scss']
})
export class EquipeComponent implements OnInit {
  orgNodes: TreeNode[] = [];
  selectedNodes: TreeNode[] = [];
  teamCards = [
    {
      title: 'Trilhas formativas',
      subtitle: 'Conteúdo aplicável',
      description:
        'Percursos pensados para acompanhar cada etapa da jornada, conectando fundamentos e desafios reais.',
      image: 'https://primefaces.org/cdn/primeng/images/card-ng.jpg'
    },
    {
      title: 'Laboratórios abertos',
      subtitle: 'Projetos orientados',
      description:
        'Ambientes para experimentar e construir soluções com apoio de especialistas e metodologias ágeis.',
      image: 'https://primefaces.org/cdn/primeng/images/card-ng.jpg'
    },
    {
      title: 'Mentorias contínuas',
      subtitle: 'Evolução guiada',
      description:
        'Acompanhamento personalizado que incentiva a autonomia, feedbacks frequentes e plano de crescimento.',
      image: 'https://primefaces.org/cdn/primeng/images/card-ng.jpg'
    }
  ];

  ngOnInit(): void {
    this.orgNodes = [
      {
        label: 'Nível 1',
        type: 'person',
        styleClass: 'orgchart-person',
        expanded: true,
        data: {
          name: 'Rogério Pinto',
          title: 'Diretor'
        },
        children: [
          {
            label: 'Nível 2',
            type: 'person',
            expanded: true,
            data: {
              name: 'Bruno Amaral',
              title: 'Gerente'
            },
            children: [
              {
                label: 'Nível 3',
                type: 'person',
                expanded: true,
                data: {
                  name: 'Dalson Caivano',
                  title: 'Coordenador'
                },
                children: [
                  {
                    label: 'Nível 3.1',
                    type: 'person',
                    data: {
                      name: 'Dalson Caivano',
                      title: 'Instrutor COBOL'
                    }
                  },
                  {
                    label: 'Nível 3.2',
                    type: 'person',
                    data: {
                      name: 'Rodrigo Monteiro',
                      title: 'Instrutor Lógica e BD'
                    }
                  },
                  {
                    label: 'Nível 3.3',
                    type: 'person',
                    data: {
                      name: 'Nicholas Fuchs',
                      title: 'Instrutor Java'
                    }
                  }
                ]
              }
            ]
          }
        ]
      }
    ];
  }
}
