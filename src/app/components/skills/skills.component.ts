import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-skills',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './skills.component.html',
  styleUrls: ['./skills.component.scss'] // <-- fix here
})
export class SkillsComponent {}
