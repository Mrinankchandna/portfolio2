import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common'; // <-- Add this

@Component({
  selector: 'app-projects',
  templateUrl: './projects.component.html',
  styleUrls: ['./projects.component.scss'],
  standalone: true,
  imports: [RouterModule, CommonModule], // <-- Add CommonModule here
})
export class ProjectsComponent implements OnInit {
  projects = [
    {
      title: 'DSA Hub',
      description: 'Developed an educational platform featuring interactive games to help users master data structures and algorithms in a fun, hands-on way.',
      technologies: ['JavaScript', 'HTML', 'CSS'],
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'Data Mining Project',
      description: 'Built data mining algorithms in Python for efficient analysis and pattern discovery.',
      technologies: ['Python', 'Pandas', 'NumPy'],
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'Keshaspree Website',
      description: 'Built a custom e-commerce website with integrated payment gateways and courier service APIs, streamlining the online shopping experience.',
      technologies: ['JavaScript', 'E-Commerce', 'API Integration'],
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'Local Goods',
      description: 'Contributed to a company e-commerce project at EPAM Systems, building scalable modules with .NET and Angular as part of a training initiative.',
      technologies: ['Angular', 'SQL', '.NET', 'Azure'],
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'VTA (Visit Tracking System)',
      description: 'Designed and developed a Power Apps canvas application with Power Automate flows to efficiently track and manage business visits.',
      technologies: ['Power Apps', 'Power Automate'],
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'Metrolinx - Client Project',
      description: 'Currently working on a confidential client project for Metrolinx, leveraging .NET, Angular, Dynamics 365 CRM, Customer Service, and Omnichannel solutions to enhance enterprise operations.',
      technologies: ['.NET', 'Angular', 'Dynamics 365 CRM', 'Customer Service', 'Omnichannel'],
      demo: '', // No public demo
      code: ''  // No public code
    }
  ];

  constructor() {}

  ngOnInit(): void {
    this.setupProjectFilters();
  }

  setupProjectFilters(): void {
    // Add filtering functionality after view is initialized
    setTimeout(() => {
      const filterButtons = document.querySelectorAll('.btn-filter');
      const projectCards = document.querySelectorAll('.project-card');

      filterButtons.forEach((button) => {
        button.addEventListener('click', (e) => {
          const target = e.target as HTMLElement;

          // Remove active class from all buttons
          filterButtons.forEach((btn) => btn.classList.remove('active'));

          // Add active class to clicked button
          target.classList.add('active');

          // Get filter value
          const filter = target.getAttribute('data-filter');

          // Filter projects
          projectCards.forEach((card) => {
            if (filter === 'all' || card.classList.contains(filter!)) {
              (card as HTMLElement).style.display = 'block';
            } else {
              (card as HTMLElement).style.display = 'none';
            }
          });
        });
      });
    }, 500);
  }
}
