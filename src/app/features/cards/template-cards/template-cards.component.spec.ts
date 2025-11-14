import { NO_ERRORS_SCHEMA } from '@angular/core';
import { TestBed } from '@angular/core/testing';
import { TemplateCardsComponent } from './template-cards.component';

describe('TemplateCardsComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [TemplateCardsComponent],
      schemas: [NO_ERRORS_SCHEMA]
    }).compileComponents();
  });

  it('should create', () => {
    const fixture = TestBed.createComponent(TemplateCardsComponent);
    const component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
