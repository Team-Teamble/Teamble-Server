export interface Project {
  id: string;
  user_id: string;
  title: string;
  intro: string;
  photo: string;
  start_date: Date;
  end_date: Date;
  area: string;
  description: string;
  created_at: Date;
  updated_at: Date;
  is_closed: boolean;
  is_deleted: boolean;
}
