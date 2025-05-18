import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';


@Component({
  selector: 'app-contact',

  templateUrl: './contact.component.html',
  styleUrl: '../../../styles/components/contact.scss',
  standalone: true,
  imports: [RouterModule],
})
export class ContactComponent {}
