<?php
error_reporting(1);

// Path to create app config file.

$pathToInstall = '/var/lib/digivalet/digivalet-config/';

// Get GIT User to perform action

$gitUser = getopt(null, ["git-user:"])['git-user'];
$gitPassword = getopt(null, ["git-password:"])['git-password'];

if ($gitUser && $gitPassword) {

    // APP CONFIG

    // Get params from Environment
    $environment = getopt('production', ["env:"])['env'];
    $mdsServerFQDN = getopt(null, ["mds-server-fqdn:"])["mds-server-fqdn"];
    $oneauthServerFQDN = getopt(null, ["oneauth-server-fqdn:"])["oneauth-server-fqdn"];
    $dvsServerFQDN = getopt(null, ["dvs-server-fqdn:"])["dvs-server-fqdn"];
    $inpremiseHISServerFQDN = getopt(null, ["inpremise-his-server-fqdn:"])["inpremise-his-server-fqdn"];
    $digivaletApiFolderName = getopt(null, ["digivalet-api-folder-name:"]);
    $cloudHISServerFQDN = getopt(null, ["cloud-his-server-fqdn:"])["cloud-his-server-fqdn"];
    $digivaletCloudApiFolderName = getopt(null, ["digivalet-cloud-api-folder-name:"])["digivalet-cloud-api-folder-name"];
    $cmsFolderName = getopt(null, ["cms-folder-name:"])["cms-folder-name"];
    $dashboardFolderName = getopt(null, ["dashboard-folder-name:"])["dashboard-folder-name"];
    $dvServicesApiFolderName = getopt(null, ["dv-services-api-folder-name:"])["dv-services-api-folder-name"];
    $dvServicesCloudApiFolderName = getopt(null, ["dv-services-cloud-api-folder-name:"])["dv-services-cloud-api-folder-name"];
    $butlerHISServerFQDN = getopt(null, ["butler-his-server-fqdn:"])["butler-his-server-fqdn"];
    $digistewardFolderName = getopt(null, ["digisteward-folder-name:"])["digisteward-folder-name"];
    $digistewardHISServerFQDN = getopt(null, ["digisteward-his-server-fqdn:"])["digisteward-his-server-fqdn"];
    $analyticsHISServerFQDN = getopt(null, ["analytics-his-server-fqdn:"])["analytics-his-server-fqdn"];
    $analyticsHISServerUsername = getopt(null, ["analytics-his-server-username:"])["analytics-his-server-username"];
    $analyticsHISServerPassword = getopt(null, ["analytics-his-server-password:"])["analytics-his-server-password"];
    $jasperhisserverFQDN = getopt(null, ["jasper-his-server-fqdn:"])["jasper-his-server-fqdn"];
    $reportName = getopt(null, ["report-name:"])["report-name"];
    $reportDirectory = getopt(null, ["report-directory:"])["report-directory"];	
    $hotelId = getopt(null, ["hotelId:"])["hotelId"];    
    $setDB = getopt(null, ["set-db:"])["set-db"];

    chdir($pathToInstall); // Change to directory // 192.168.0.66 --> gitrepo.digivalet.com
    exec("rm -rf php-common-files"); // Removing existing php common files folder if exiss.
    exec("git clone http://" . $gitUser . ":" . $gitPassword . "@192.168.0.66:7990/scm/pp/php-common-files.git");
    chdir('php-common-files');
    exec("git checkout origin/master -- digivalet-cms-dashboard-configuration/app-config.json");
    copy('./digivalet-cms-dashboard-configuration/app-config.json', $pathToInstall . '/app-config.json');
    $setDB ? copy('./digivalet-cms-dashboard-configuration/database-config.json', $pathToInstall . '/database-config.json') : false;
    chdir($pathToInstall);

    echo getcwd();

    //read the entire string
    $str = file_get_contents($pathToInstall . '/app-config.json');

    $str = str_replace("@environment-to-set@", ($environment ? $environment : 'qa'), $str);
    $str = str_replace("@mds-server-fqdn@", ($mdsServerFQDN ? $str = str_replace("@mds-server-fqdn@", "$mdsServerFQDN", $str) : "@mds-server-fqdn@"), $str);
    $str = str_replace("@oneauth-server-fqdn@", ($oneauthServerFQDN ? $str = str_replace("@oneauth-server-fqdn@", "$oneauthServerFQDN", $str) : "@oneauth-server-fqdn@"), $str);
    $str = str_replace("@dvs-server-fqdn@", ($dvsServerFQDN ? $str = str_replace("@dvs-server-fqdn@", "$dvsServerFQDN", $str) : "@dvs-server-fqdn@"), $str);
    $str = str_replace("@cloud-his-server-fqdn@", ($cloudHISServerFQDN ? $str = str_replace("@cloud-his-server-fqdn@", "$cloudHISServerFQDN", $str) : "@cloud-his-server-fqdn@"), $str);
    $str = str_replace("@inpremise-his-server-fqdn@", ($inpremiseHISServerFQDN ? $str = str_replace("@inpremise-his-server-fqdn@", "$inpremiseHISServerFQDN", $str) : "@inpremise-his-server-fqdn@"), $str);
    $str = str_replace("@digivalet-api-folder-name@", ($digivaletApiFolderName ? $str = str_replace("@digivalet-api-folder-name@", "$digivaletApiFolderName", $str) : "digivalet-api"), $str);
    $str = str_replace("@digivalet-cloud-api-folder-name@", ($digivaletCloudApiFolderName ? $str = str_replace("@digivalet-cloud-api-folder-name@", "$digivaletCloudApiFolderName", $str) : "digivalet-cloud-api"), $str);
    $str = str_replace("@cms-folder-name@", ($cmsFolderName ? $str = str_replace("@cms-folder-name@", "$cmsFolderName", $str) : "cms"), $str);
    $str = str_replace("@dashboard-folder-name@", ($dashboardFolderName ? $str = str_replace("@dashboard-folder-name@", "$dashboardFolderName", $str) : "dashboard"), $str);
    $str = str_replace("@dv-services-api-folder-name@", ($dvServicesApiFolderName ? $str = str_replace("@dv-services-api-folder-name@", "$dvServicesApiFolderName", $str) : "dv-services-api"), $str);
    $str = str_replace("@dv-services-cloud-api-folder-name@", ($dvServicesCloudApiFolderName ? $str = str_replace("@dv-services-cloud-api-folder-name@", "$dvServicesCloudApiFolderName", $str) : "dv-services-cloud-api"), $str);
    $str = str_replace("@butler-his-server-fqdn@", ($butlerHISServerFQDN ? $str = str_replace("@butler-his-server-fqdn@", "$butlerHISServerFQDN", $str) : "@butler-his-server-fqdn@"), $str);
    $str = str_replace("@digisteward-folder-name@", ($digistewardFolderName ? $str = str_replace("@digisteward-folder-name@", "$digistewardFolderName", $str) : "@digisteward-folder-name@"), $str);
    $str = str_replace("@digisteward-his-server-fqdn@", ($digistewardHISServerFQDN ? $str = str_replace("@digisteward-his-server-fqdn@", "$digistewardHISServerFQDN", $str) : "@digisteward-his-server-fqdn@"), $str);
    $str = str_replace("@analytics-his-server-fqdn@", ($analyticsHISServerFQDN ? $str = str_replace("@analytics-his-server-fqdn@", "$analyticsHISServerFQDN", $str) : "@analytics-his-server-fqdn@"), $str);
    $str = str_replace("@analytics-his-server-username@", ($analyticsHISServerUsername ? $str = str_replace("@analytics-his-server-username@", "$analyticsHISServerUsername", $str) : "@analytics-his-server-username@"), $str);
    $str = str_replace("@analytics-his-server-password@", ($analyticsHISServerPassword ? $str = str_replace("@analytics-his-server-password@", "$analyticsHISServerPassword", $str) : "@analytics-his-server-password@"), $str);
    $str = str_replace("@jasper-his-server-fqdn@", ($jasperhisserverFQDN ? $str = str_replace("@jasper-his-server-fqdn@", "$jasperhisserverFQDN", $str) : "@jasper-his-server-fqdn@"), $str);
    $str = str_replace("@report-name@", ($reportName ? $str = str_replace("@report-name@", "$reportName", $str) : "@report-name@"), $str);
    $str = str_replace("@report-directory@", ($reportDirectory ? $str = str_replace("@report-directory@", "$reportDirectory", $str) : "@report-directory@"), $str);	
    $str = str_replace("@hotelId@", ($hotelId ? $str = str_replace("@hotelId@", "$hotelId", $str) : "@hotelId@"), $str);
    //write the entire string
    file_put_contents($pathToInstall . '/app-config.json', $str);

// DATABASE CONFIG

    if ($setDB) {
        $inpremiseMDSServerFQDN = getopt(null, ["inpremise-mds-server-fqdn:"])["inpremise-mds-server-fqdn"];
        $inpremiseMDSServerUsername = getopt(null, ["inpremise-mds-server-username:"])["inpremise-mds-server-username"];
        $inpremiseMDSServerPassword = getopt(null, ["inpremise-mds-server-password:"])["inpremise-mds-server-password"];
        $inpremiseMDSDatabaseName = getopt(null, ["inpremise-mds-database-name:"])["inpremise-mds-database-name"];

        $cloudMDSServerFQDN = getopt(null, ["cloud-mds-server-fqdn:"])["cloud-mds-server-fqdn"];
        $cloudMDSServerUsername = getopt(null, ["cloud-mds-server-username:"])["cloud-mds-server-username"];
        $cloudMDSServerPassword = getopt(null, ["cloud-mds-server-password:"])["cloud-mds-server-password"];
        $cloudMDSDatabaseName = getopt(null, ["cloud-mds-database-name:"])["cloud-mds-database-name"];

        $oneauthMDSServerFQDN = getopt(null, ["oneauth-mds-server-fqdn:"])["oneauth-mds-server-fqdn"];
        $oneauthMDSServerUsername = getopt(null, ["oneauth-mds-server-username:"])["oneauth-mds-server-username"];
        $oneauthMDSServerPassword = getopt(null, ["oneauth-mds-server-password:"])["oneauth-mds-server-password"];
        $oneauthMDSDatabaseName = getopt(null, ["oneauth-mds-database-name:"])["oneauth-mds-database-name"];

        //read the entire string
        $dbContent = file_get_contents($pathToInstall . '/database-config.json');

        $dbContent = str_replace("@inpremise-mds-server-fqdn@", ($inpremiseMDSServerFQDN ? $dbContent = str_replace("@inpremise-mds-server-fqdn@", "$inpremiseMDSServerFQDN", $dbContent) : "@inpremise-mds-server-fqdn@"), $dbContent);
        $dbContent = str_replace("@inpremise-mds-server-username@", ($inpremiseMDSServerUsername ? $dbContent = str_replace("@inpremise-mds-server-username@", "$inpremiseMDSServerUsername", $dbContent) : "@inpremise-mds-server-username@"), $dbContent);
        $dbContent = str_replace("@inpremise-mds-server-password@", ($inpremiseMDSServerPassword ? $dbContent = str_replace("@inpremise-mds-server-password@", "$inpremiseMDSServerPassword", $dbContent) : "@inpremise-mds-server-password@"), $dbContent);
        $dbContent = str_replace("@inpremise-mds-database-name@", ($inpremiseMDSDatabaseName ? $dbContent = str_replace("@inpremise-mds-database-name@", "$inpremiseMDSDatabaseName", $dbContent) : "digivalet"), $dbContent);

        $dbContent = str_replace("@cloud-mds-server-fqdn@", ($cloudMDSServerFQDN ? $dbContent = str_replace("@cloud-mds-server-fqdn@", "$cloudMDSServerFQDN", $dbContent) : "@cloud-mds-server-fqdn@"), $dbContent);
        $dbContent = str_replace("@cloud-mds-server-username@", ($cloudMDSServerUsername ? $dbContent = str_replace("@cloud-mds-server-username@", "$cloudMDSServerUsername", $dbContent) : "@cloud-mds-server-username@"), $dbContent);
        $dbContent = str_replace("@cloud-mds-server-password@", ($cloudMDSServerPassword ? $dbContent = str_replace("@cloud-mds-server-password@", "$cloudMDSServerPassword", $dbContent) : "@cloud-mds-server-password@"), $dbContent);
        $dbContent = str_replace("@cloud-mds-database-name@", ($cloudMDSDatabaseName ? $dbContent = str_replace("@cloud-mds-database-name@", "$cloudMDSDatabaseName", $dbContent) : "digivalet_cloud"), $dbContent);

        $dbContent = str_replace("@oneauth-mds-server-fqdn@", ($oneauthMDSServerFQDN ? $dbContent = str_replace("@oneauth-mds-server-fqdn@", "$oneauthMDSServerFQDN", $dbContent) : "@oneauth-mds-server-fqdn@"), $dbContent);
        $dbContent = str_replace("@oneauth-mds-server-username@", ($oneauthMDSServerUsername ? $dbContent = str_replace("@oneauth-mds-server-username@", "$oneauthMDSServerUsername", $dbContent) : "@oneauth-mds-server-username@"), $dbContent);
        $dbContent = str_replace("@oneauth-mds-server-password@", ($oneauthMDSServerPassword ? $dbContent = str_replace("@oneauth-mds-server-password@", "$oneauthMDSServerPassword", $dbContent) : "@oneauth-mds-server-password@"), $dbContent);
        $dbContent = str_replace("@oneauth-mds-database-name@", ($oneauthMDSDatabaseName ? $dbContent = str_replace("@oneauth-mds-database-name@", "$oneauthMDSDatabaseName", $dbContent) : "oneauth"), $dbContent);

        //write the entire string
        file_put_contents($pathToInstall . '/database-config.json', $dbContent);
    }

    rmdir_recursive($pathToInstall . '/php-common-files');
    echo "\n";
} else {
    echo "\n\n::: ERROR ::: Unable to create configuration files. Kindly pass `GIT credentials` \n\n";
}

function rmdir_recursive($dir)
{
    $it = new RecursiveDirectoryIterator($dir, FilesystemIterator::SKIP_DOTS);
    $it = new RecursiveIteratorIterator($it, RecursiveIteratorIterator::CHILD_FIRST);
    foreach ($it as $file) {
        if ($file->isDir()) {
            rmdir($file->getPathname());
        } else {
            unlink($file->getPathname());
        }

    }
    rmdir($dir);
}

