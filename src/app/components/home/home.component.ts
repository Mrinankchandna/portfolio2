import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-home',
  
  templateUrl: './home.component.html',
  styleUrl: '../../../styles/components/home.scss',
  standalone: true,
  imports: [RouterModule],
})
export class HomeComponent {}
