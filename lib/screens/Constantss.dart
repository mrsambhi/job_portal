class Constants{
  static final String BaseUrl = "https://arcane-eyrie-98677.herokuapp.com";
  static final String loginProvider = BaseUrl+"/login_employer/login_employer";
  static final String loginSeeker = BaseUrl+"/login_jobseeker/login_jobseeker";
  static final String signUpProvider = BaseUrl+"/reg_employer/addemployer";
  static final String signUpSeeker = BaseUrl+"/reg_jobseeker/addjobseeker";
  static final String providerProfile = BaseUrl+"/employer_profile/view_profile";
  static final String seekerProfile = BaseUrl+"/jobseeker_profile/view_profile";
  static final String seekerUpdateProfile = BaseUrl+"/reg_jobseeker/edit:id";
  static final String providerUpdateProfile = BaseUrl+"/reg_employer/edit";
  static final String addJobs = BaseUrl+"/jobs/addjob";
  static final String viewJobs = BaseUrl+"/jobs/view";


  // SESSION PARAMETER

  static final String loginStatus="LOGIN_STATUS";
  static final String userId="USER_ID";

}