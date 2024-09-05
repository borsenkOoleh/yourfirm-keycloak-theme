<#import "template.ftl" as layout>
<@layout.emailLayout>
${kcSanitize(msg("welcomeEmailHTML", user, realmName))?no_esc}
</@layout.emailLayout>