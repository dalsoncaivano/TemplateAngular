import { Component, OnInit } from '@angular/core';
import { TreeNode } from 'primeng/api';

@Component({
  selector: 'app-orgchart',
  standalone: false,
  templateUrl: './orgchart.component.html',
  styleUrls: ['./orgchart.component.scss']
})
export class OrgchartComponent implements OnInit {
  data: TreeNode[] = [];
  selectedNode?: TreeNode;

  ngOnInit(): void {
    this.data = [
      {
        label: 'Diretoria',
        expanded: true,
        children: [
          {
            label: 'Tiago Silva',
            type: 'dep',
            expanded: true,
            children: [
              { label: 'Ana Lima', type: 'colaborador' },
              { label: 'Rafael Costa', type: 'colaborador' }
            ]
          },
          {
            label: 'Maria Souza',
            type: 'dep',
            expanded: true,
            children: [
              { label: 'Pedro Martins', type: 'colaborador' },
              { label: 'Juliana Rocha', type: 'colaborador' }
            ]
          }
        ]
      }
    ];
  }
}
