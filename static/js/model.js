
    var User = Backbone.Model.extend({
      defaults: {
        name: 'broken name',
        userName: 'broken username', 
        email: 'broken email'
      }
    });

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

    var Category = Backbone.Model.extend({
      defaults: {
        category_title: 'broken category title',
        sections: new SectionCollection()
      }
    });

    CategoryCollection = Backbone.Collection.extend({
      model: Category
    });

    var Article = Backbone.Model.extend({
      defaults:{
        subject: 'broken subject',
        categories : new CategoryCollection()
      },
      url: function(){
        return '/article/' + this.id;
      }

    });

    ArticleCollection = Backbone.Collection.extend({
        model: Article,
        comparator: 'id'
    });

    var Collection = Backbone.Model.extend({
        Articles: new ArticleCollection()
    });

    var Pending = Backbone.Model.extend({
      defaults: {
        userName: 'broken username',
        owner_id: '',
        approved: false,
        body: 'broken body'
      }
    });

    CollectionCollection = Backbone.Collection.extend({
        model: Collection
    });

    PendingCollection = Backbone.Collection.extend({
      model: Pending,
      comparator: function(model) {
        return model.get('userName');
      }
    });

