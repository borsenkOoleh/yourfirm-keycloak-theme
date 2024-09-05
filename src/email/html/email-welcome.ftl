<#import "template.ftl" as layout>
<@layout.emailLayout>
${kcSanitize(msg("emailWelcomeBodyHtml", user, realmName))?no_esc}
</@layout.emailLayout>