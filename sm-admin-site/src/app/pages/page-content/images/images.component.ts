import { Component, OnInit } from '@angular/core';
import { environment } from '../../../../environments/environment';
import { TokenService } from '../../auth/services/token.service';
import { TreeModel, DownloadModeEnum, ConfigInterface } from 'ng6-file-man';
import xhook from 'xhook';

@Component({
  selector: 'images-table',
  templateUrl: './images.component.html',
  styleUrls: ['./images.component.scss'],
})
export class ImagesComponent implements OnInit {
  url = environment.apiUrl;
  uploadedFiles: any[] = [];
  _albums: any[] = [];
  loadingList = false;
  isPopup = false;
  tree: TreeModel;
  appLanguage = 'en';

  treeConfig: ConfigInterface = {
    baseURL: this.url,
    api: {
      listFile: '/v1/private/content/list',
      uploadFile: '/v1/private/content/images/add',
      downloadFile: '/v1/content/images/download',
      deleteFile: '/v1/private/content/images/remove',
      createFolder: 'api/directory',//not supported
      renameFile: '/v1/private/content/images/rename',
      searchFiles: 'api/search'//not supported
    },
    options: {
      allowFolderDownload: DownloadModeEnum.DOWNLOAD_DISABLED,
      showFilesInsideTree: true
    }
  };

  constructor(
    private tokenService: TokenService,
  ) {
  }

  ngOnInit() {

    this.tree = new TreeModel(this.treeConfig);

    const token: string = this.tokenService.getToken();
    // console.log('token', token);

    if (token) {
      xhook.before(function (request) {
        request.headers['Authorization'] = 'Bearer ' + token;
      });
    }
  }

}
