    ////////////Define model//////////////

    var Collection = Backbone.Model.extend({
        Articles: new ArticleCollection()
    });

    var Article = Backbone.Model.extend({
      defaults:{
        subject: 'broken subject',
        categories : new Categories()
      },
      url: function(){
        return 'http://localhost:3000/article/' + this.id;
      }

    });

    var Category = Backbone.Model.extend({
      defaults: {
        category_title: 'broken category title',
        sections: new Sections()
      }
    });

    var Section = Backbone.Model.extend({
      defaults: {
      section_title : "broken title",
      section_body : "broken text",
      }
    });

    var User = Backbone.Model.extend({
      defaults: {
        name: 'broken name',
        userName: 'broken username', 
        email: 'broken email'
      }
    });

    var Pending = Backbone.Model.extend({
      defaults: {
        userName: 'broken username',
        owner_id: '',
        approved: false,
        body: 'broken body'
      }
    });

    var Resource = Backbone.Model.extend({
      defaults: {
        title : "Wikipedia link",
        body: "someurl.com/wiki/Something",
        created: new Date()
      }
    }); 

    ////////////Define collections//////////////

    CollectionCollection = Backbone.Collection.extend({
        model: Collection
    });

    ArticleCollection = Backbone.Collection.extend({
        model: Article,
        comparator: 'id'
    });

    CategoryCollection = Backbone.Collection.extend({
      model: Category
    });

    SectionCollection = Backbone.Collection.extend({
      model: Section,
      comparator: function(model) {
        return model.get('created');
      }
    });

    PendingCollection = Backbone.Collection.extend({
      model: Pending,
      comparator: function(model) {
        return model.get('userName');
      }
    });

    ResourceCollection = Backbone.Collection.extend({
      model: Resource
    });

