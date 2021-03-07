/// 环境枚举
enum env { development, production }

Map<env, String> baseUrlMap = {
  env.development: 'https://factory.myjuniu.com/',
  env.production: 'https://factory.myjuniu.com/'
};

Map<env, String> baseApiMap = {
  env.development: 'new-mf-fac/',
  env.production: 'new-mf-fac/'
};

class Address {
  static String baseUrl =
      baseUrlMap[env.development] + baseApiMap[env.development];
}
