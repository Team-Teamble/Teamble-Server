const util = {
  success: (status: number, message: string, data: {}) => {
    return {
      status,
      success: true,
      message,
      data,
    };
  },
  fail: (status: number, message: string) => {
    return {
      status,
      success: false,
      message,
    };
  },
};

export = util;
