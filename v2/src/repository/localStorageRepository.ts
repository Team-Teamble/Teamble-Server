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

  private async saveUsers(users: User[]) {
    this.localStorage.setItem('users', JSON.stringify(users));
  }
}
