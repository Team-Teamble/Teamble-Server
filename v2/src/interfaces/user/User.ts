export interface User {
  id: string;
  email: string;
  name: string;
  phone: string;
  photo: string;
  type_id: number | null;
  university: string;
  major: string;
  area: string;
  intro: string;
  description: string;
  is_checked: boolean;
  created_at: Date;
  updated_at: Date;
  is_deleted: boolean;
}
