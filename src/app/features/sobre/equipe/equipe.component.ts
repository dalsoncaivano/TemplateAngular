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
      title: 'Dalson Caivano',
      subtitle: 'Coordenador',
      description:
        'Além de coordenar o time de formação, atua também como instrutor de COBOL. Possui experiência como desenvolvedor e coordenador em fábrica de software, além de ter exercido a função de analista de sistemas. Já atuou como PO em projetos.',
      image: 'assets/images/gerais/Dalson.jpg',
      linkedin: 'https://www.linkedin.com/in/dalson-dos-anjos-caivano-9a44742b'
    },
    {
      title: 'Nicholas Fuchs',
      subtitle: 'Instrutor Java',
      description:
        'Enorme experiência técnica em desenvolvimento de sistemas inclusive como Tech Lead.',
      image: 'https://primefaces.org/cdn/primeng/images/card-ng.jpg',
      linkedin: 'https://www.linkedin.com/in/nicholas-fuchs-1a65678b/'
    },
    {
      title: 'Rodrigo Monteiro',
      subtitle: 'Instrutor BD e Lógica',
      description:
        'Ampla experiência no setor acadêmico, atuando em diversas disciplinas. Especialista em banco de dados e lógica de Programação.',
      image: 'assets/images/gerais/RodrigoMonteiro.jpg',
      linkedin: 'https://www.linkedin.com/in/rodrigo-monteiro-697b0452/'
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
