<#import "template.ftl" as layout>
<@layout.emailLayout>
<div style="background:white;background-color:white;margin:0px auto;max-width:600px;">
<table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="background:white;background-color:white;width:100%;">
    <tbody>
    <tr>
        <td style="border:0;direction:ltr;font-size:0px;padding:8px;text-align:center;">
        <!--[if mso | IE]><table role="presentation" border="0" cellpadding="0" cellspacing="0"><tr><td class="" style="vertical-align:top;width:584px;" ><![endif]-->
        <div class="mj-column-per-100 mj-outlook-group-fix" style="font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;">
            <table border="0" cellpadding="0" cellspacing="0" role="presentation" style="vertical-align:top;" width="100%">
            <tbody>
                <tr>
                <td align="center" style="font-size:0px;padding:24px;word-break:break-word;">
                    <table border="0" cellpadding="0" cellspacing="0" role="presentation" style="border-collapse:collapse;border-spacing:0px;">
                    <tbody>
                        <tr>
                        <td style="width:536px;">
                            <img alt="" src="https://tf-auth0-shared-public-assets.s3.eu-central-1.amazonaws.com/yourfirm/headline_invitation.png" style="border:0;display:block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;" width="536" height="auto" />
                        </td>
                        </tr>
                    </tbody>
                    </table>
                </td>
                </tr>
            </tbody>
            </table>
        </div>
        </td>
    </tr>
    </tbody>
</table>
</div>
<!--[if mso | IE]></td></tr></table><![endif]-->
${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
</@layout.emailLayout>
