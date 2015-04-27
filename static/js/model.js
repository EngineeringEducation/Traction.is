//User
    var User = Backbone.Model.extend({
      defaults: {
        name: 'broken name',
        userName: 'broken username', 
        email: 'broken email'
      }
    });
//###################################################################
//Resource
//###################################################################
    var Resource = Backbone.Model.extend({
      defaults: {
        title : "Wikipedia link",
        body: "someurl.com/wiki/Something",
        created: new Date()
      }
    }); 

    ResourceCollection = Backbone.Collection.extend({
      model: Resource
    });
//###################################################################
//Section
//###################################################################
    var Section = Backbone.Model.extend({
      defaults: {
        section_title : "broken title",
        section_body : "broken text",
        resources: new ResourceCollection()
      }
    });

    SectionCollection = Backbone.Collection.extend({
      model: Section,
      comparator: function(model) {
        return model.get('created');
      }
    });
//###################################################################
//Category
//###################################################################
    var Category = Backbone.Model.extend({
      defaults: {
        category_title: 'broken category title',
        sections: new SectionCollection()
      }
    });

    CategoryCollection = Backbone.Collection.extend({
      model: Category
    });
//###################################################################
//Articles
//###################################################################
    var Article = Backbone.Model.extend({
      defaults:{
        subject: 'broken subject',
        categories : new SectionCollection()
      },
      url: function(){
        return '/article/' + this.id;
      }

    });

    ArticleCollection = Backbone.Collection.extend({
        model: Article,
        comparator: 'id'
    });
//###################################################################
//Collection
//###################################################################
    var Collection = Backbone.Model.extend({
        defaults: {
          articles: new ArticleCollection(),
          title: 'broken title',
          owner_id: 'broken owner_id',
          created: 'broken collection timestamp'
        },
        url: function() {
          return "/collections/" + this.id;
        }
    });

    CollectionCollection = Backbone.Collection.extend({
        model: Collection,
        url: function() {
          return "/collections";
        }
    });
//###################################################################
    var Pending = Backbone.Model.extend({
      defaults: {
        userName: 'broken username',
        owner_id: '',
        approved: false,
        body: 'broken body'
      }
    });



    PendingCollection = Backbone.Collection.extend({
      model: Pending,
      comparator: function(model) {
        return model.get('userName');
      }
    });

