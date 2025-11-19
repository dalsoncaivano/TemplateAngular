import { NO_ERRORS_SCHEMA } from '@angular/core';
import { TestBed } from '@angular/core/testing';
import { TemplateTableComponent } from './template-table.component';

describe('TemplateTableComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [TemplateTableComponent],
      schemas: [NO_ERRORS_SCHEMA]
    }).compileComponents();
  });

  it('should create', () => {
    const fixture = TestBed.createComponent(TemplateTableComponent);
    const component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
