function toSafeDetails(details = {}) {
  return Object.fromEntries(
    Object.entries(details).filter(([, value]) => value !== undefined)
  );
}

export function logServerEvent(event, details = {}) {
  console.info(
    JSON.stringify({
      level: "info",
      event,
      ts: new Date().toISOString(),
      ...toSafeDetails(details),
    })
  );
}

export function logServerError(event, error, details = {}) {
  console.error(
    JSON.stringify({
      level: "error",
      event,
      ts: new Date().toISOString(),
      message: error instanceof Error ? error.message : String(error),
      ...toSafeDetails(details),
    })
  );
}
