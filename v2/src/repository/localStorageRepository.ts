import { LocalStorage } from 'node-localstorage';
import { nanoid } from 'nanoid';
import { Repository } from '.';
import { Project } from '../entity/project';
import { User } from '../entity/user';

export class LocalStorageRepository implements Repository {
  localStorage: LocalStorage;

  constructor(fileLocation: string) {
    this.localStorage = new LocalStorage(fileLocation);
  }

  async createUser(user: Pick<User, 'email' | 'name' | 'phone'>): Promise<User> {
    const users = await this.getUsers();
    const newUser = {
      ...user,
      id: nanoid(),
      photo: '',
      type_id: null,
      university: '',
      major: '',
      area: '',
      intro: '',
      description: '',
      is_checked: true,
      created_at: new Date(),
      updated_at: new Date(),
      is_deleted: false,
    };
    users.push(newUser);
    await this.saveUsers(users);
    return newUser;
  }

  async getUsers(): Promise<User[]> {
    const raw = this.localStorage.getItem('users');
    if (!raw) {
      return [];
    }
    return JSON.parse(raw) as User[];
  }

  async getUserById(userId: string): Promise<User | null> {
    const users = await this.getUsers();
    const foundUser = users.find((user) => user.id === userId);

    if (foundUser) {
      return foundUser;
    } else {
      return null;
    }
  }

  async createProject(project: Pick<Project, 'title' | 'intro'>): Promise<Project> {
    const projects = await this.getProjects();
    const newProject = {
      ...project,
      id: nanoid(),
      user_id: 'LpGg9qrNEeAzf0I2s0DQP',
      photo: 'www..',
      start_date: new Date(),
      end_date: new Date(),
      area: '서울',
      description: '모여라모여',
      created_at: new Date(),
      updated_at: new Date(),
      is_closed: false,
      is_deleted: false,
    };
    projects.push(newProject);
    await this.saveProjects(projects);
    return newProject;
  }

  async getProject(projectId: string): Promise<Project | null> {
    const projects = await this.getProjects();
    const foundProject = projects.find((project) => project.id === projectId);

    if (foundProject) {
      return foundProject;
    } else {
      return null;
    }
  }

  async getProjects(): Promise<Project[]> {
    const raw = this.localStorage.getItem('projects');
    if (!raw) {
      return [];
    }
    return JSON.parse(raw) as Project[];
  }

  private async saveUsers(users: User[]) {
    this.localStorage.setItem('users', JSON.stringify(users));
  }

  private async saveProjects(projects: Project[]) {
    this.localStorage.setItem('projects', JSON.stringify(projects));
  }
}
