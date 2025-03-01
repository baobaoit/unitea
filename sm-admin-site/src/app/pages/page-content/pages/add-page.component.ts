import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CrudService } from '../../shared/services/crud.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ConfigService } from '../../shared/services/config.service';
import { ImageBrowserComponent } from '../../../@theme/components/image-browser/image-browser.component';
import { NbDialogService } from '@nebular/theme';
import { validators } from '../../shared/validation/validators';
import { environment } from '../../../../environments/environment';
declare var jquery: any;
declare var $: any;

@Component({
  selector: 'add-page',
  templateUrl: './add-page.component.html',
  styleUrls: ['./add-page.component.scss'],
})
export class AddPageComponent implements OnInit  {

  uniqueCode: string;//identifier fromroute
  form: FormGroup;
  content: any;

  loadingList = false;
  visible: any = false;
  descData: any;
  updatedID: any;
  mainmenu: any = false;
  code: string = '';
  order: number = 0;
  buttonText: string = 'Save';
  language: string = 'en';
  description: Array<any> = []
  languages = [];

  defaultLanguage = localStorage.getItem('lang');
  //changed from seo section
  currentLanguage = localStorage.getItem('lang');

  codeExits: any;
  message: string = '';

  public scrollbarOptions = { axis: 'y', theme: 'minimal-dark' };


  editorConfig = {
    placeholder: '',
    tabsize: 2,
    height: 300,
    toolbar: [
      ['misc', ['codeview', 'fullscreen', 'undo', 'redo']],
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
      ['fontsize', ['fontname', 'fontsize', 'color']],
      ['para', ['style', 'ul', 'ol', 'height']],
      ['insert', ['table', 'link', 'video']],
      ['customButtons', ['testBtn']]
    ],

    buttons: {
      'testBtn': this.customButton.bind(this)
    },
    fontNames: ['Helvetica', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Roboto', 'Times']
  };
  constructor(
    private crudService: CrudService,
    public router: Router,
    private toastr: ToastrService,
    private configService: ConfigService,
    private dialogService: NbDialogService,
    private activatedRoute: ActivatedRoute,
    private fb: FormBuilder,
  ) {
    this.configService.getListOfSupportedLanguages(localStorage.getItem('merchant'))
      .subscribe(res => {
        this.languages = res;
        this.languages.forEach(lang => {
          this.description.push({
            language: lang.code,
            name: '',
            description: '',
            path: '',
            friendlyUrl: '',
            title: '',
            metaDescription: '',
            keyWords: '',
          });
        });
      });
  }

  ngOnInit() {
    this.getPage();
  }

  getPage() {
    this.uniqueCode = this.activatedRoute.snapshot.paramMap.get('code');
    this.createForm();
    this.addFormArray();//create array
    this.crudService.get(`/v1/content/pages/${this.uniqueCode}?lang=_all&store=${environment.merchantStore}`)
      .subscribe(data => {
        this.updatedID = data.id;
        this.visible = data.visible;
        this.mainmenu = data.displayedInMenu;
        this.code = data.code;
        this.order = 0;
        this.descData = data.descriptions
        this.content = data;
        this.buttonText = 'Update';
        this.fillForm();

      }, error => {
      });
  }



  private createForm() {
    this.form = this.fb.group({
      id:0,
      code: ['', [Validators.required,Validators.pattern(validators.alphanumeric)]],
      visible: [false],
      selectedLanguage: [this.defaultLanguage, [Validators.required]],
      descriptions: this.fb.array([]),
    });
  }

  addFormArray() {
    const control = <FormArray>this.form.controls.descriptions;
    this.languages.forEach(lang => {
      control.push(
        this.fb.group({
          language: [lang.code, [Validators.required]],
          description: [''],
          name: [''],
          title: [''],
          id:0
        })
      );
    });
  }
  

  fillFormArray() {
    this.form.value.descriptions.forEach((desc, index) => {
      if (this.content != null && this.content.descriptions) {
        this.content.descriptions.forEach((description) => {
          if (desc.language === description.language) {
            (<FormArray>this.form.get('descriptions')).at(index).patchValue({
              id: description.id,
              language: description.language,
              description: description.description,
              name: description.name,
              title: description.title
            });
          }
        });
      }
    });
  }




  fillForm() {
    this.descData.forEach((newvalue, index) => {
      this.description.forEach((value, index) => {
        if (newvalue.language == value.language) {
          value.name = newvalue.name
          value.friendlyUrl = newvalue.friendlyUrl
          value.title = newvalue.title
          value.description = newvalue.description
          value.metaDescription = newvalue.metaDescription
          value.keyWords = newvalue.keyWords
          // value.highlights = newvalue.highlights
        }
      });

    })
    // console.log(this.description);
  }
  focusOutFunction() {
    this.crudService.get('/v1/content/' + this.code)
      .subscribe(data => {
        this.codeExits = true;
        this.message = "This code already exist"
      }, error => {
        this.codeExits = false;
        this.message = "This code is available"
      });
  }
  urlTitle(event, lang) {
    let text = event.target.value;
    var characters = [' ', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '+', '=', '_', '{', '}', '[', ']', '|', '/', '<', '>', ',', '.', '?', '--'];

    for (var i = 0; i < characters.length; i++) {
      var char = String(characters[i]);
      text = text.replace(new RegExp("\\" + char, "g"), '-');
    }
    text = text.toLowerCase();
    this.description.forEach((value, index) => {
      if (lang == value.language) {
        value.friendlyUrl = text
      }
    });
    // this.en.slug = text;
  }

  createPages() {
    this.loadingList = true;
    let param = {
      "code": this.code,
      // "contentType": "PAGE",
      "descriptions": this.description,
      "linkToMenu": this.mainmenu,
      "visible": this.visible
    }
    if (localStorage.getItem('contentpageid')) {
      this.crudService.put('/v1/private/content/page/' + this.updatedID, param)
        .subscribe(data => {
          this.loadingList = false;
          this.toastr.success('Page updated successfully');
          // this.buttonText = 'Update';
          // this.titleText = 'Update page details';
          // // this.getContentDetails();
          this.router.navigate(['/pages/content/pages/list']);
        }, error => {
          this.loadingList = false;
        });
    } else {
      this.crudService.post('/v1/private/content/page', param)
        .subscribe(data => {
          console.log(data);
          this.loadingList = false;
          this.toastr.success('Page added successfully');
          // this.getContentDetails();
          this.router.navigate(['/pages/content/pages/list']);
        }, error => {
          this.loadingList = false;
        });
    }

  }

  selectLanguage(lang) {
    this.form.patchValue({
      selectedLanguage: lang,
    });
    this.currentLanguage = lang;
  }

  goToback() {
    this.router.navigate(['/pages/content/pages/list']);
  }
  customButton(context) {
    const me = this;
    const ui = $.summernote.ui;
    const button = ui.button({
      contents: '<i class="note-icon-picture"></i>',
      tooltip: 'Gallery',
      container: '.note-editor',
      className: 'note-btn',
      click: function () {
        me.dialogService.open(ImageBrowserComponent, {}).onClose.subscribe(name => name && context.invoke('editor.pasteHTML', '<img src="' + name + '">'));
      }
    });
    return button.render();
  }
}
