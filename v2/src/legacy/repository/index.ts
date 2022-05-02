import mysql from 'mysql2/promise';
import { Project } from '../../interfaces/Project';
import { User } from '../../interfaces/user/User';

export interface Repository {
  createUser(user: Pick<User, 'email' | 'name' | 'phone'>): Promise<User>;
  getUsers(): Promise<User[]>;
  getUserById(userId: string): Promise<User | null>;
  createProject(project: Pick<Project, 'title' | 'intro'>): Promise<Project>;
  getProject(projectId: string): Promise<Project | null>;
  getProjects(): Promise<Project[]>;
}

export interface Repository2 {
  createUser(user: Pick<User, 'email' | 'name' | 'phone'>, client: mysql.PoolConnection): Promise<User>;
}
