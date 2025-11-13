import { TestBed } from '@angular/core/testing';
import { EquipeComponent } from './equipe.component';

describe('EquipeComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [EquipeComponent]
    }).compileComponents();
  });

  it('should create', () => {
    const fixture = TestBed.createComponent(EquipeComponent);
    const component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
