import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CodeCardComponent } from '../../components/code-card/code-card.component';
import { FakeTerminalComponent } from '../../components/fake-terminal/fake-terminal.component';

@Component({
  selector: 'app-home',
  standalone: true,
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  imports: [RouterModule, CodeCardComponent, FakeTerminalComponent],
})
export class HomeComponent {}
