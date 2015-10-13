<%inherit file='/setup/setup_base.tpl'/>

<%block name="step_title">
    <span class="icon icon-account-key"></span>
    ${_('Superuser account')}
</%block>

<%block name="step_desc">
    <p>
        ${_('Superuser account is used to maintain the library and configure the receiver.')}
    </p>
</%block>

<%block name="step">
<div class="step-superuser-form">
    % if form.error:
    ${form.error}
    % endif
    <p>
        ${form.username.label}
        ${form.username}
        % if form.username.error:
        ${form.username.error}
        % endif
    </p>
    <p>
        ${form.password1.label}
        ${form.password1}
        % if form.password1.error:
        ${form.password1.error}
        % endif
    </p>
    <p>
        ${form.password2.label}
        ${form.password2}
        % if form.password2.error:
        ${form.password2.error}
        % endif
    </p>
    <p class="superuser-note">
        <span class="label">${_('Password reset token')}</span>
        <span class="large">${reset_token}</span>
        <span class="field-help">
        ${_('Please write down this password reset token and store it securely. You will need it if you ever need to reset your password.')}
        </span>
        ${h.HIDDEN('reset_token', reset_token)}
    </p>
</div>
</%block>
