import { NO_ERRORS_SCHEMA } from '@angular/core';
import { TestBed } from '@angular/core/testing';
import { TemplateButtonsComponent } from './template-buttons.component';

describe('TemplateButtonsComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [TemplateButtonsComponent],
      schemas: [NO_ERRORS_SCHEMA]
    }).compileComponents();
  });

  it('should create', () => {
    const fixture = TestBed.createComponent(TemplateButtonsComponent);
    const component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
