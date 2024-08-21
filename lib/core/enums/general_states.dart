enum GeneralStates {
  // Normal States
  init,
  loading,
  success,

  // User Problems States
  offline,
  badRequest,
  unexpectedProblem,

  // Backend Problems States
  notFound,
  forbidden,
  unAuthorized,
  subscribeExpired,
  internalServerProblem,
}
