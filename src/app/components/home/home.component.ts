import { Component, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CodeCardComponent } from '../../components/code-card/code-card.component';

@Component({
  selector: 'app-home',
  standalone: true,
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  imports: [RouterModule, CodeCardComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA] ,
})
export class HomeComponent {}
