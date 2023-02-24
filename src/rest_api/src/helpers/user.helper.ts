interface User {
  role: string;
  user_id: string;
}

export class UserHelper {
  public user: User;

  setUser({ role, user_id }: User) {
    this.user = {
      role,
      user_id,
    };
  }

  getUSer() {
    return this.user;
  }
}
