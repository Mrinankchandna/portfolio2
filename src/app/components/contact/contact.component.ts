import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss'], // <-- fix here
  standalone: true,
  imports: [RouterModule],
})
export class ContactComponent {}
