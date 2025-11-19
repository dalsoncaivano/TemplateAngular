import { TestBed } from '@angular/core/testing';
import { GalleriaModule } from 'primeng/galleria';
import { BannerComponent } from './banner.component';

describe('BannerComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GalleriaModule],
      declarations: [BannerComponent]
    }).compileComponents();
  });

  it('should create', () => {
    const fixture = TestBed.createComponent(BannerComponent);
    const component = fixture.componentInstance;
    expect(component).toBeTruthy();
  });
});
