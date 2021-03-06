<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo Filters::noXSS($title); ?> Flyspray</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="styles/setup.css" type="text/css" media="screen" />
</head>
<body>
<div id="center">
  <div id="container">
    <div id="header">
      <div id="logo">
        <h1><a href="<?php echo Filters::noXSS($index); ?>" title="Flyspray - The bug Killer!"><?php echo L('upgrade'); ?></a></h1>
      </div><!-- End of logo -->
    </div><!-- End of header -->
    <div id="content">
      <div id="bodyContent">
      <form action="upgrade.php" method="post" onsubmit="document.getElementById('upgradebutton').disabled = true;return true;" >
      <input type="hidden" name="upgrade" value="1" />
        <div class="install">
            <h2><?php echo L('preconditionchecks'); ?></h2>
            <p><?php echo sprintf(L('versioncompare'), $installed_version, $short_version); ?>
            <div class="installBlock">
				<table class="formBlock">
				<tr>
					<td valign="top">../<?php echo Filters::noXSS(basename(CONFIG_PATH)); ?></td>
					<td align="left"><b><?php if ($checks['config_writable']): ?><span class="green">writeable</span><?php else: ?><span class="red">not writeable</span><?php endif; ?></b></td>
					<td>&nbsp;</td>
                </tr><tr>
					<td valign="top">Database connection</td>
					<td align="left"><b><?php if ($checks['db_connect']): ?><span class="green">OK</span><?php else: ?><span class="red">Failed</span><?php endif; ?></b></td>
					<td>&nbsp;</td>
				</tr>
				</table>
				<p><?php echo L('writeaccessconf'); ?></p>
			</div>
            <?php if (!$upgrade_possible): ?>
            Apparently, an upgrade is not possible. <?php echo Filters::noXSS($todo); ?>

            <?php else: ?>
            <?php echo L('upgradepossible'); ?>
            </p>

            <h2><?php echo L('precautions'); ?></h2>
            <p><?php echo L('precautionbackup'); ?></p>

            <?php if (isset($upgrade_options)): ?>
            <h2>Upgrade options</h2>
            <p><?php echo $upgrade_options; ?></p>
            <?php endif; ?>

            <h2><?php echo L('performupgrade'); ?></h2>
<p><input name="upgrade" id="upgradebutton" class="button" value="<?php echo eL('performupgrade'); ?>" type="submit" /></p>
<?php if (isset($done)): ?>
<div class="green"><?php echo join('<br />',$upgradelog); ?></div>
<p>If all went fine:
<ol>
<li>Delete setup directory or restrict access to this directory by a htaccess rule.</li>
<li><a href="../" class="button" style="padding:4px;background-color:#fff;border-radius:3px;border:1px solid #000;display:inline-block">Back to Overview</a></li>
</ol>
</p>
<?php else: ?>
(this may take a while)
<?php endif; ?>
<?php endif; ?>
        </div><!-- End of install -->
        </form>
        <div class="clr"></div>
      </div><!-- End of bodyContent -->
      <div class="clr"></div>
    </div><!-- End of content -->
    <div id="footer">
      <p>
        Flyspray <?php echo Filters::noXSS($fs->version); ?> [Fly Flapper]<br />
        Copyright 2004-<?php echo Filters::noXSS(date('Y')); ?> &copy; The Flyspray team.  All rights reserved.
      </p>
    </div><!-- End of footer -->
  </div><!-- End of container -->
</div><!-- End of center -->
</body>
</html>
