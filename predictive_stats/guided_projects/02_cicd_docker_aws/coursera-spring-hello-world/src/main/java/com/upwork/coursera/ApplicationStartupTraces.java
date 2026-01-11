package com.upwork.coursera;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.stream.Collectors;
import java.util.stream.Stream;

final class ApplicationStartupTraces {

  private static final String SEPARATOR = "-".repeat(58);
  private static final String BREAK = "\n";

  private static final Logger log = LoggerFactory.getLogger(ApplicationStartupTraces.class);

  private ApplicationStartupTraces() {}

  static String of(ApplicationContext ctx) {

    return new ApplicationStartupTracesBuilder()
      .append(BREAK)
      .appendSeparator()
      .append(applicationRunningTrace(ctx.getEnvironment()))
      .append(localUrl(ctx))
      .append(externalUrl(ctx))
      .append(profilesTrace(ctx.getEnvironment()))
      .appendSeparator()
      .append(configServer(ctx.getEnvironment()))
      .build();
  }

  private static String applicationRunningTrace(Environment environment) {
    String applicationName = environment.getProperty("spring.application.name");

    if (StringUtils.isBlank(applicationName)) {
      return "Application is running!";
    }

    return new StringBuilder().append("Application '").append(applicationName).append("' is running!").toString();
  }

  private static String localUrl(ApplicationContext ctx) {
    return url("Local", "localhost", ctx);
  }

  private static String externalUrl(ApplicationContext ctx) {
    return url("External", hostAddress(), ctx);
  }

  private static String url(String type, String host, ApplicationContext ctx) {
    if (notWebEnvironment(ctx.getEnvironment())) {
      return null;
    }

    StringBuilder str = new StringBuilder()
      .append(type)
      .append(": \t")
      .append(protocol(ctx.getEnvironment()))
      .append("://")
      .append(host)
      .append(":")
      .append(port(ctx.getEnvironment()))
      .append(contextPath(ctx.getEnvironment()));
    try {
      if (!ctx.getBeansOfType(Class.forName("io.swagger.v3.oas.models.OpenAPI")).isEmpty()) {
        str.append(swaggerPath());
      }
    } catch (ClassNotFoundException e) {
      log.trace("Not OPEN ");
    }
    return str.toString();
  }

  private static boolean notWebEnvironment(Environment environment) {
    return StringUtils.isBlank(environment.getProperty("server.port"));
  }

  private static String protocol(Environment environment) {
    if (noKeyStore(environment)) {
      return "http";
    }

    return "https";
  }

  private static boolean noKeyStore(Environment environment) {
    return StringUtils.isBlank(environment.getProperty("server.ssl.key-store"));
  }

  private static String port(Environment environment) {
    return environment.getProperty("server.port");
  }

  private static String profilesTrace(Environment environment) {
    String[] profiles = environment.getActiveProfiles();

    if (ArrayUtils.isEmpty(profiles)) {
      return null;
    }

    return new StringBuilder().append("Profile(s): \t").append(Stream.of(profiles).collect(Collectors.joining(", "))).toString();
  }

  private static String hostAddress() {
    try {
      return InetAddress.getLocalHost().getHostAddress();
    } catch (UnknownHostException e) {
      log.warn("The host name could not be determined, using `localhost` as fallback");
    }

    return "localhost";
  }

  private static String contextPath(Environment environment) {
    String contextPath = environment.getProperty("server.servlet.context-path");

    if (StringUtils.isBlank(contextPath)) {
      return "/";
    }

    return contextPath;
  }

  private static String swaggerPath() {
    return "swagger-ui/index.html";
  }

  private static String configServer(Environment environment) {
    String configServer = environment.getProperty("configserver.status");

    if (StringUtils.isBlank(configServer)) {
      return null;
    }

    return new StringBuilder().append("Config Server: ").append(configServer).append(BREAK).append(SEPARATOR).append(BREAK).toString();
  }

  private static final class ApplicationStartupTracesBuilder {

    private static final String SPACER = "  ";

    private final StringBuilder trace = new StringBuilder();

    public ApplicationStartupTracesBuilder appendSeparator() {
      trace.append(SEPARATOR).append(BREAK);

      return this;
    }

    public ApplicationStartupTracesBuilder append(String line) {
      if (line == null) {
        return this;
      }

      trace.append(SPACER).append(line).append(BREAK);

      return this;
    }

    public String build() {
      return trace.toString();
    }
  }
}
