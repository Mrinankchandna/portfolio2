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
      category: 'Web Development',
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'Data Mining Project',
      description: 'Built data mining algorithms in Python for efficient analysis and pattern discovery.',
      technologies: ['Python', 'Pandas', 'NumPy'],
      category: 'Application',
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'Keshaspree Website',
      description: 'Built a custom e-commerce website with integrated payment gateways and courier service APIs, streamlining the online shopping experience.',
      technologies: ['JavaScript', 'E-Commerce', 'API Integration'],
      category: 'Web Development',
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'Local Goods',
      description: 'Contributed to a company e-commerce project at EPAM Systems, building scalable modules with .NET and Angular as part of a training initiative.',
      technologies: ['Angular', 'SQL', '.NET', 'Azure'],
      category: 'Web Development',
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'VTA (Visit Tracking System)',
      description: 'Designed and developed a Power Apps canvas application with Power Automate flows to efficiently track and manage business visits.',
      technologies: ['Power Apps', 'Power Automate'],
      category: 'Application',
      demo: '', // No public demo
      code: ''  // No public code
    },
    {
      title: 'Metrolinx - Client Project',
      description: 'Currently working on a confidential client project for Metrolinx, leveraging .NET, Angular, Dynamics 365 CRM, Customer Service, and Omnichannel solutions to enhance enterprise operations.',
      technologies: ['.NET', 'Angular', 'Dynamics 365 CRM', 'Customer Service', 'Omnichannel'],
      category: 'Application',
      demo: '', // No public demo
      code: ''  // No public code
    }
  ];

  filteredProjects = [...this.projects];
  selectedFilter = 'All';

  constructor() {}

  ngOnInit(): void {}

  filterProjects(filter: string): void {
    this.selectedFilter = filter;
    if (filter === 'All') {
      this.filteredProjects = [...this.projects];
    } else {
      this.filteredProjects = this.projects.filter(project => project.category === filter);
    }
  }
}
