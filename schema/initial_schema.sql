-- id is "todays' date + hours of the day + (turnicated of the first 10 chracters of sha 256 of uuuid of any object)

CREATE TABLE types (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    attributes JSONB NOT NULL,
    version INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT
);

CREATE TABLE operational_entities (
    id VARCHAR(20) PRIMARY KEY,
    entity_type INT REFERENCES types(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    attributes JSONB NOT NULL
);

CREATE TABLE operational_relationships (
    id VARCHAR(20) PRIMARY KEY,
    node1_id VARCHAR(20) REFERENCES operational_entities(id),
    node2_id VARCHAR(20) REFERENCES operational_entities(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    attributes JSONB NOT NULL
);

-- write down the tests before querying the database
-- enforce the data validation at the insertion time
INSERT INTO types (id, version, name, description, attributes) VALUES ('2024051712d2d2d2d2d2', 1,'Employee','employee schema','{"id":"f47ac10b-58cc-4372-a567-0e02b2c3d479","name":"Employee","description":"Employee Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Employee","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the entry."},"employee_id":{"type":"string","description":"Unique identifier for the employee."},"first_name":{"type":"string","description":"First name of the employee."},"last_name":{"type":"string","description":"Last name of the employee."}},"required":["id","employee_id","first_name","last_name"]}}');

INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024051712ff6430adff','2024051712d2d2d2d2d2','{"id":"550e8400-e29b-41d4-a716-446655440000","first_name":"Bahador","last_name":"Biglari","employee_id":1}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120e5b657e0d1','2024051712ff6430adff','2024052109fc299c6512','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('202405212062ef2f90c6','2024051712ff6430adff','2024052109cc7a77048a','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120218369a428','2024051712ff6430adff','20240521099a05364d4a','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120660cbc2f9c','2024051712ff6430adff','2024052119d33ae3a8fb','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120be9ade6e42','2024051712ff6430adff','2024052120bf4726fe0c','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120833516697c','2024051712ff6430adff','2024052120df754eaabf','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('202405212104680449e0','2024051712ff6430adff','202405212048f4134e92','{}');


INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240517129d8c27b29d','2024051712d2d2d2d2d2','{"id":"6a447c78-cb8b-4076-b4ab-b1c64a3e16d2","first_name":"Farzad","last_name":"Qassemi","employee_id":2}');

INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120e5b657e0d1','20240517129d8c27b29d','2024052109fc299c6512','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('202405212062ef2f90c6','20240517129d8c27b29d','2024052109b539eeda6c','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120218369a428','20240517129d8c27b29d','20240521099b61410360','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120660cbc2f9c','20240517129d8c27b29d','2024052119a776c41667','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120be9ade6e42','20240517129d8c27b29d','202405212063954f1db3','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120833516697c','20240517129d8c27b29d','2024052121b6f9f70a7d','{}');
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('202405212104680449e0','20240517129d8c27b29d','202405212048f4134e92','{}');


-- employee to employment type relationship
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('20240521192c3e82fd29','2024051712d2d2d2d2d2','202405210790db1ba3fe','{}');
-- employee to role relationship
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('20240521209ab12d0935','2024051712d2d2d2d2d2','2024052107c6ba0f964f','{}');
-- employee to position relationship
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('20240521207e855cf4e9','2024051712d2d2d2d2d2','2024052109a383519ba0','{}');
-- employee to department relationship
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120eb2398a1fa','2024051712d2d2d2d2d2','202405211466f89695af','{}');
-- employee to salary relationship
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120340b271d49','2024051712d2d2d2d2d2','202405210745290b68e8','{}');
-- employee to status relationship
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('2024052120686a3b01c6','2024051712d2d2d2d2d2','202405211372bb0f2623','{}');
-- employee to location
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('20240521200c221050d7','2024051712d2d2d2d2d2','202405212026b95d208b','{}');


INSERT INTO types (id, version, name, description, attributes) VALUES ('202405210790db1ba3fe', 1,'EmployementType','employement type schema','{"id":"cbbf4cc6-4459-4236-bb0e-fe0d7d82b46c","name":"EmployementType","description":"Employee Type Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"EmploymentType","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the employment type."},"type":{"type":"string","enum":["full_time","part_time","contractor"],"description":"The type of employment which can be full-time, part-time, or contractor."}},"required":["id","type"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052109fc299c6512','202405210790db1ba3fe','{"id":"314e7a73-bb28-40c2-adaa-e4b0683f63c4","type":"full_time"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521095262a2f811','202405210790db1ba3fe','{"id":"ffb91d6c-3059-4eaf-811d-fbae3d0d3600","type":"part_time"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521096e3ecf9fc9','202405210790db1ba3fe','{"id":"6fe1c28d-e404-4390-be23-0db84e090a2e","type":"contractor"}');

INSERT INTO types (id,version, name, description, attributes) VALUES ('2024052107c6ba0f964f',1,'Role','Role Schema','{"id":"f98a2441-403b-44bb-ab0f-e97e1d5ebdcd","name":"Role","description":"Role Schema for an Employee","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Role","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the role."},"name":{"type":"string","enum":["manager","executive","individual_contributor","other"],"description":"Name of the role."},"description":{"type":"string","description":"Description of the role."}},"required":["id","name","description"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052109fb997db17c','2024052107c6ba0f964f','{"id":"9317e090-929e-48b9-825e-cf43a1dfccfc","name":"manager","description":"Responsible for overseeing team operations and ensuring project success."}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052109cc7a77048a','2024052107c6ba0f964f','{"id":"57241a4d-7a57-4fc7-ae23-d74c4b539d42","name":"executive","description":"Part of the senior management team, responsible for strategic decision-making."}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052109b539eeda6c','2024052107c6ba0f964f','{"id":"6f7928b2-abfa-4d1a-b911-a0baa8a70733","name":"individual_contributor","description":"Works independently on projects and tasks, contributing specialized skills."}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('202405210916267dee15','2024052107c6ba0f964f','{"id":"d86466ad-c358-4e63-9bd0-f859bd87c64f","name":"other","description":"Roles that do not fit into the predefined categories."}');

INSERT INTO types (id,version, name, description, attributes) VALUES ('2024052109a383519ba0',1,'Position','Position Schema','{"id":"bce2c8dc-2a3a-4ab1-bf61-c77626f39b10","name":"Position","description":"Position Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Position","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the position."},"title":{"type":"string","description":"Title of the position."},"description":{"type":"string","description":"Description of the position."},"level":{"type":"string","description":"Level of the position within the organizational hierarchy."}},"required":["id","title","level","description"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521099a05364d4a','2024052109a383519ba0','{"id":"8d151a40-cb32-4df8-8146-744ac4b2ae20","title":"CEO","description":"Chief Executive Officer responsible for overall strategic and operational management.","level":"100"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521099b61410360','2024052109a383519ba0','{"id":"55ab1d54-d75c-4715-8e76-3d215bba66f6","title":"Software Engineer","description":"Responsible for designing, developing, and maintaining software systems.","level":"64"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('202405210982d3a6f78c','2024052109a383519ba0','{"id":"8c444d7e-c022-471b-bf07-e78b04f9aa62","title":"Fractional CFO","description":"Part-time Chief Financial Officer providing financial strategy and oversight.","level":"80"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052109d32e4969a7','2024052109a383519ba0','{"id":"55e95499-bd36-4205-8ee0-d0705567c4e8","title":"Customer Support","description":"Assists customers by providing product information and resolving issues.","level":"50"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521134f390d827d','2024052109a383519ba0','{"id":"c945a2b1-b831-4d70-94bc-f8af91978bc8","title":"DevOps Engineer","description":"Responsible for designing, developing, and maintaining software systems.","level":"60"}');

INSERT INTO types (id, version, name, description, attributes) VALUES ('202405211441e5c869fe',1,'Product','Product schema','{"id":"5b91245b-d20e-4fbf-91eb-d6ffbae82db4","name":"Product","description":"Product Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Product","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the product."},"name":{"type":"string","description":"Name of the product."},"description":{"type":"string","description":"Description of the product."},"amount":{"type":"object","properties":{"value":{"type":"number","description":"The price value of the product."},"currency":{"type":"string","description":"Currency of the product price."}},"required":["value","currency"]}},"required":["id","name","amount"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052117fc3cf686ed','202405211441e5c869fe','{"id":"408faeee-deed-4dee-9bac-c204ed896937","name":"Data and Trending Insight, and Anomaly Detection","description":"Provides insights based on historical and actual data, including anomaly detection, trending insights, and variance analysis.","amount":{"value":100,"currency":"USD"}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052117e873667071','202405211441e5c869fe','{"id":"a1a6c946-30a7-472e-bb4a-876affb54068","name":"Prediction, Forecasting, and Scenario Planning","description":"Offers prediction, forecasting, and scenario planning capabilities.","amount":{"value":200,"currency":"USD"}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521179a7074c701','202405211441e5c869fe','{"id":"3a4dcdc8-779f-40d0-9da6-6486777d7ac4","name":"Operation Execution","description":"Facilitates operation execution.","amount":{"value":300,"currency":"USD"}}');

INSERT INTO types (id, version, name, description, attributes) VALUES ('2024052113cf08be60f8',1,'Subscription','Subscription Schema','{"id":"c47e4184-0fe5-40e8-ae42-743b5b96f552","name":"Subscription","description":"Subscription Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Subscription","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the subscription."},"amount":{"type":"object","properties":{"value":{"type":"number","description":"The price value of the product."},"currency":{"type":"string","description":"Currency of the product price."}},"required":["value","currency"]}},"frequency":{"type":"string","enum":["monthly","yearly","quarterly"],"description":"The frequency of the subscription."}},"required":["id","amount","frequency"]}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052118ae360e2e44','2024052113cf08be60f8','{"id":"518abb7b-4959-46ec-a120-97ce91e287e3","name":"Data Insight and Anomaly Detection Subscription","description":"Monthly subscription for Data Insight and Anomaly Detection.","amount":{"value":2000,"currency":"USD"},"frequency":"monthly"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521186852eb1f0c','2024052113cf08be60f8','{"id":"a2cf9009-8970-47c1-ae0d-2e1953067a9c","name":"Prediction and Scenario Planning Subscription","description":"Monthly subscription for Prediction and Scenario Planning.","amount":{"value":2000,"currency":"USD"},"frequency":"monthly"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052118328e671af1','2024052113cf08be60f8','{"id":"8aa5f26b-0b13-4136-aaad-747b099aff9e","name":"Operation Execution Subscription","description":"Monthly subscription for Operation Execution.","amount":{"value":2000,"currency":"USD"},"frequency":"monthly"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052118f2ede0a036','2024052113cf08be60f8','{"id":"c8b2cbb8-b236-4644-b557-1a0a8dfa5da3","name":"Data Insight and Prediction Subscription","description":"Monthly subscription for Data Insight and Anomaly Detection and Prediction and Scenario Planning with a 10% discount.","amount":{"value":3600,"currency":"USD"},"frequency":"monthly"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052118121af47371','2024052113cf08be60f8','{"id":"f52a1924-cf5e-42b3-b767-55ff4f6fac9e","name":"Data Insight and Operation Execution Subscription","description":"Monthly subscription for Data Insight and Anomaly Detection and Operation Execution with a 10% discount.","amount":{"value":3600,"currency":"USD"},"frequency":"monthly"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521182e198ed9db','2024052113cf08be60f8','{"id":"e80f3df2-26e1-4f5f-a54f-07065e026860","name":"Prediction and Operation Execution Subscription","description":"Monthly subscription for Prediction and Scenario Planning and Operation Execution with a 10% discount.","amount":{"value":3600,"currency":"USD"},"frequency":"monthly"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052118d7737fa0d5','2024052113cf08be60f8','{"id":"19a94238-10ef-4d88-924e-34084f64d526","name":"All-Inclusive Subscription","description":"Monthly subscription for Data Insight and Anomaly Detection, Prediction and Scenario Planning, and Operation Execution with a 15% discount.","amount":{"value":5100,"currency":"USD"},"frequency":"monthly"}');


-- product to subscription relationship
INSERT INTO operational_relationships (id, node1_id, node2_id, attributes) VALUES ('20240521203609d9a488','202405211441e5c869fe','2024052113cf08be60f8','{}');

-- INSERT INTO types (id, version, name, description, attributes) VALUES ('2024052114415a051022',1,'Product Line','Product Line schema','{"id":"406a18f9-dbee-4a27-bab9-7d0ca3c7d091","name":"Product Line","description":"Product Line Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"ProductLine","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the product line."},"name":{"type":"string","description":"Name of the product line."},"description":{"type":"string","description":"Description of the product line."}},"required":["id","name"]}}');
-- INSERT INTO types (id, version, name, description, attributes) VALUES ('20240521148dd1d2cbad',1,'Division','Division Schema','{"id":"78887397-50ca-47c9-b89a-3baabdad77e2","name":"Division","description":"this represent Divisions","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Division","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the division."},"name":{"type":"string","description":"Name of the division."},"description":{"type":"string","description":"Description of the division."}},"required":["id","name"]}}');
INSERT INTO types (id, version, name, description, attributes) VALUES ('202405211466f89695af',1,'Department','Department Schema','{"id":"39a76a7c-c531-48be-b298-1545a9a2a324","name":"Department","description":"this represent departments","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Department","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the department."},"name":{"type":"string","description":"Name of the department."}},"required":["id","name"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052119a776c41667','202405211466f89695af','{"id":"25e1228a-88db-497c-a102-1ef4d656b1d4","name":"R&D"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052119b9ca992956','202405211466f89695af','{"id":"1061a789-b2cd-449a-8de7-25f583e90d4c","name":"Sales"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521194aa136600d','202405211466f89695af','{"id":"b9a89f08-7344-445a-a2bd-ddd4a679d1f0","name":"Marketing"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052119d966c4c7cb','202405211466f89695af','{"id":"ed975ec9-d425-464b-86a4-046aaddb7b32","name":"Customer Support"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052119d33ae3a8fb','202405211466f89695af','{"id":"52bf1203-dc51-49ce-b9d1-42f65ee8b8f6","name":"General Management"}');



-- INSERT INTO types (id, version, name, description, attributes) VALUES ('20240521141544fc8c85',1,'Function','Function Schema','{"id":"d127d0c4-deb5-4cbb-a5f6-61f87d96121b","name":"Function","description":"this represents Functions","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Function","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the function."},"name":{"type":"string","description":"Name of the function."},"description":{"type":"string","description":"Description of the function."}},"required":["id","name"]}}');
INSERT INTO types (id, version, name, description, attributes) VALUES ('202405210745290b68e8',1,'Compensation','Compensation Schema','{"id":"1db6ebc9-ced6-4b07-b1a5-e98910248526","name":"Compensation","description":"Compensation Schema for an Employee","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Compensation","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the compensation entry."},"base_salary":{"type":"object","properties":{"value":{"type":"number","description":"Base salary amount."},"currency":{"type":"string","description":"Currency of the base salary."}},"required":["value","currency"],"description":"Base salary amount and currency."},"effective_date":{"type":"string","format":"date","description":"Date when the compensation becomes effective."}},"required":["id","base_salary"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052120df754eaabf','202405210745290b68e8','{"id":"2d08c51f-fe57-4ac8-8f55-403cd4cec744","base_salary":{"value":0,"currency":"USD"},"effective_date":"2024-01-01"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052121b6f9f70a7d','202405210745290b68e8','{"id":"85586eda-470a-4e13-84a7-b0c4978f2fcc","base_salary":{"value":0,"currency":"CAD"},"effective_date":"2024-01-01"}');


INSERT INTO types (id, version, name, description, attributes) VALUES ('202405211372bb0f2623',1,'Status','Status Schema','{"id":"18302a70-6efa-455c-9f87-51c1827b5809","name":"Status","description":"Status Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Status","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for this object"},"status":{"type":"string","enum":["active","inactive","terminated","pending","expired","cancelled"],"description":"Status of this object."}},"required":["id","status"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('202405212048f4134e92','202405211372bb0f2623','{"id":"d8298843-07dc-430c-90d2-30c40f7d2a89","status":"active"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('20240521203061f3b29f','202405211372bb0f2623','{"id":"5bba6c9a-0d3a-4edb-b8b5-5ad1ab96263b","status":"inactive"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052120ef5fa4eca6','202405211372bb0f2623','{"id":"352c05fa-ed76-413a-856b-a5e2a4b771ac","status":"terminated"}');


INSERT INTO types (id, version, name, description, attributes) VALUES ('20240521138aa006fd4e',1,'Company','Company Schema','{"id":"45d37b9e-67ea-4182-98f8-54479899926f","name":"Company","description":"Company Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Company","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the company."},"name":{"type":"string","description":"Name of the company."},"description":{"type":"string","description":"Description of the company."},"industry":{"type":"string","description":"Industry in which the company operates."}},"required":["id","name","industry"]}}');
INSERT INTO types (id, version, name, description, attributes) VALUES ('2024052113cb5d43b7d1',1,'Legal Entity','Legal Entity Schema','{"id":"272efaba-a834-40dd-8fe9-b198f1dc9952","name":"Legal Entity","description":"Legal Entity Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Entity","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the entity."},"name":{"type":"string","description":"Name of the entity."},"description":{"type":"string","description":"Description of the entity."},"entity_type":{"type":"string","description":"Type of the entity."},"created_at":{"type":"string","format":"date-time","description":"Timestamp when the entity was created."},"updated_at":{"type":"string","format":"date-time","description":"Timestamp when the entity was last updated."}},"required":["id","name","entity_type","created_at","updated_at"]}}');

INSERT INTO types (id, version, name, description, attributes) VALUES ('202405212026b95d208b',1,'Location','Location Schema','{"id":"be39fff6-9a2d-4d4c-a371-073ffc10b7f3","name":"Location ","description":"Location Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Location","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the location."},"name":{"type":"string","description":"Name of the location."},"address":{"type":"string","description":"Address of the location."},"city":{"type":"string","description":"City of the location."},"state":{"type":"string","description":"State of the location."},"country":{"type":"string","description":"Country of the location."},"postal_code":{"type":"string","description":"Postal code of the location."}},"required":["id","name","address","city","state","country","postal_code"]}}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('202405212063954f1db3','202405212026b95d208b','{"id":"0c5b3cf8-ba61-4d64-9a9f-1b7e9fb598c8","name":"Canada Office","address":"295 Hagey Blvd","city":"Waterloo","state":"ON","country":"Canada","postal_code":"N2L6R5"}');
INSERT INTO operational_entities (id, entity_type, attributes) VALUES ('2024052120bf4726fe0c','202405212026b95d208b','{"id":"58ede429-454e-49e7-88d0-3cb106ce138c","name":"US Office","address":"2018 156th Ave NE","city":"Bellevue","state":"WA","country":"USA","postal_code":"98007"}');


INSERT INTO types (id, version, name, description, attributes) VALUES ('2024052113b4a4026051',1,'Customer','Cutomer Schema','{"id":"a4b1706b-8fb6-48b4-9a3f-13beff5705d2","name":"Customer","description":"Customer Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Customer","type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the customer."},"type":{"type":"string","enum":["individual", "business", "government", "non_profit", "educational_institution", "partner"],"description":"Type of customer, either individual or business."}},"required":["id","type"]}}');


INSERT INTO transactions (id, issue_date, accrual_date, cash_date, amount, description, documents, created_at, from_entity, to_entity) VALUES ('2024052107f0490b5d9d',);

CREATE TABLE transactions (
    id VARCHAR(20) PRIMARY KEY,
    issue_date DATE NOT NULL,
    accrual_date DATE NOT NULL,
    cash_date DATE NOT NULL,
    amount JSONB NOT NULL,
    description TEXT NOT NULL,
    documents JSONB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    from JSONB NOT NULL,
    to JSONB NOT NULL,
    related_transactions JSONB NOT NULL
);

-- CREATE TABLE financial_entities (
--     id VARCHAR(20) PRIMARY KEY,
--     attributes JSONB NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     entity_type INT REFERENCES types(id),
-- );

-- adding type Asset Current
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712c4a8b7e1d2','1 - Assets - Current','Current asset from BalanceSheet','{"id":"ab2f29a1-97d3-4c62-81b9-0f3f6a1b2c45","name":"Assets - Current","description":"Assets - Current Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Assets - Current","type":"object","properties":{"assets_current":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the current asset entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["assets_current"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722ec95dd8880','2024051712c4a8b7e1d2','{"id":"b5e53006-50b6-4773-b923-7b647cc953ce","account_number":"1100","account_name":"Cash in Bank","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('202405172210e93dd4bf','2024051712c4a8b7e1d2','{"id":"4b61e983-c6a0-4a7a-9a2b-62b3fbbef0bd","account_number":"1201","account_name":"Undeposited Funds","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722190b8226a8','2024051712c4a8b7e1d2','{"id":"6bbdf823-335e-4cff-b262-a16e7eb3d7ca","account_number":"1202","account_name":"Accounts Receivables (AR)","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517225d26dd9fd6','2024051712c4a8b7e1d2','{"id":"3cb397b5-3bb0-43af-a4b7-4a3055a84955","account_number":"1203","account_name":"Prepaid","control_group":"Assets - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722db20699e47','2024051712c4a8b7e1d2','{"id":"31d33a9b-7a01-497d-a703-bd194ac7df38","account_number":"1250","account_name":"Inventory","control_group":"Assets - Current","type":"Balance Sheet"}');

-- Adding type long term asset
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712b5e6a3c4d7','1 - Assets - Long Term','Long term asset from BalanceSheet','{"id":"f3e9c2f1-18b4-4eb2-bd8e-1c3a6b2e4d9f","name":"Assets - Long Term","description":"Assets - Long Term Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Assets - Long Term","type":"object","properties":{"assets_long_term":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the long term asset entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["assets_long_term"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722dde5799bdb','2024051712b5e6a3c4d7','{"id":"22ad6818-8a8e-4f22-b56e-84a1470fe1a0","account_number":"1400","account_name":"Term Assets","control_group":"Assets - Long Term","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517222c79426d54','2024051712b5e6a3c4d7','{"id":"f54e8155-7793-49c3-b4e8-2f8aef6b089b","account_number":"1499","account_name":"Other Current Assets","control_group":"Assets - Long Term","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051722fe71abb2f2','2024051712b5e6a3c4d7','{"id":"8dd07bbc-91b9-40cd-80b0-a24f8dd8e5c7","account_number":"1510","account_name":"Fixed Assets (Including Depreciation)","control_group":"Assets - Long Term","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517220e67019ee2','2024051712b5e6a3c4d7','{"id":"f1ea4ba1-df15-4f88-9df7-0ee25aa47829","account_number":"1520","account_name":"Other Long Term Assets","control_group":"Assets - Long Term","type":"Balance Sheet"}');

-- current liabilities
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712e8a7d6b1c2','2 - Liabilities - Current','Current liabilities from BalanceSheet','{"id":"471d6e8c-14b3-4d29-8e1f-2b8e5c3a6b9e","name":"Liabilities - Curren","description":"Liabilities - Curren Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Liabilities - Current","type":"object","properties":{"liabilities_current":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the current liability entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["liabilities_current"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240520239e9c000d37','2024051712e8a7d6b1c2','{"id":"10392185-af90-4faf-b332-1c122b97d9e2","account_number":"2100","account_name":"Current Liabilities","control_group":"Liabilities - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('202405202315170416eb','2024051712e8a7d6b1c2','{"id":"f58f73d5-e738-4f8f-85e1-92b4b45eca1e","account_number":"2101","account_name":"Accrual","control_group":"Liabilities - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023bb12516af4','2024051712e8a7d6b1c2','{"id":"dc32e051-415a-460b-9db3-58b32db3a321","account_number":"2102","account_name":"Deferred","control_group":"Liabilities - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023a36c5e9c3d','2024051712e8a7d6b1c2','{"id":"6f9b196e-dd18-4933-ab62-62f85642e033","account_number":"2110","account_name":"Accounts Payable (AP)","control_group":"Liabilities - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023f845402ca8','2024051712e8a7d6b1c2','{"id":"cdf89b47-5b50-4cc8-8050-829a9191418e","account_number":"2110","account_name":"Credit Card","control_group":"Liabilities - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023929ee3ce70','2024051712e8a7d6b1c2','{"id":"2eeb9a93-b071-43ae-9eee-c6e185f50425","account_number":"2150","account_name":"Customer Deposit","control_group":"Liabilities - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023d451b92f84','2024051712e8a7d6b1c2','{"id":"17616d64-831a-49d0-89c5-87661fd0d279","account_number":"2201","account_name":"Short Term Notes","control_group":"Liabilities - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023454528242a','2024051712e8a7d6b1c2','{"id":"b5367a23-ab79-4196-a87c-f1ac02e0a710","account_number":"2210","account_name":"Interest on ST Notes","control_group":"Liabilities - Current","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240520234a33d83989','2024051712e8a7d6b1c2','{"id":"60c66d1d-aac6-4f8c-8a59-8cc1ea06166c","account_number":"2499","account_name":"Other Current Liabilities","control_group":"Liabilities - Current","type":"Balance Sheet"}');

-- long term liabilities
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712a1d4b7c9e5','2 - Liabilities - Long Term','Long Term liabilities from BalanceSheet','{"id":"d4b5f7c1-2e4f-4c69-87b0-4f5a6e3c8d9f","name":"Liabilities - Long Term","description":"Liabilities - Long Term Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Liabilities - Long Term","type":"object","properties":{"liabilities_long_term":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the long term liability entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["liabilities_long_term"]}}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052022d9d72322a0','2024051712a1d4b7c9e5','{"id":"89d09bf1-5b47-4bb0-a797-b7de4cdc4130","account_number":"2500","account_name":"Long Term Liabilities","control_group":"Liabilities - Long Term","type":"Balance Sheet"}');

-- equity
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712b7a8d9c1e2','3 - Equity','Equity from BalanceSheet','{"id":"c3e8d7a5-16b4-4e8a-9d1f-5e2b6a7c8e1d","name":"Equity","description":"Equity Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Equity","type":"object","properties":{"equity":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the equity entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["equity"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240520236612358cd7','2024051712b7a8d9c1e2','{"id":"6e6943d6-e29c-4484-9109-d962ecc8c057","account_number":"3010","account_name":"Distribution","control_group":"Equity","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('202405202366f8879b77','2024051712b7a8d9c1e2','{"id":"44aeb63c-d600-46e1-9f49-8d36413f6a3e","account_number":"3050","account_name":"Shareholder Equity - Generic","control_group":"Equity","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023b4c9afc572','2024051712b7a8d9c1e2','{"id":"300903a1-79ff-4756-9db0-f26e51af5572","account_number":"3080","account_name":"Net Income","control_group":"Equity","type":"Balance Sheet"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240520239f016f1ac5','2024051712b7a8d9c1e2','{"id":"c820301f-4a19-449c-af7f-20f19602db47","account_number":"3090","account_name":"Retained Earnings","control_group":"Equity","type":"Balance Sheet"}');

-- revenue 
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712d5a7c8b9e0','4 - Revenue','Revenue from P&L','{"id":"9b5d4e3c-76b4-4a6e-9b1a-6f8c7d5a1b9e","name":"Revenue","description":"Revenue Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Revenue","type":"object","properties":{"revenue":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the revenue entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["revenue"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023f64ea7456a','2024051712d5a7c8b9e0','{"id":"1d34de53-cc11-4837-b723-6c19897bddef","account_number":"4000","account_name":"Revenue - Generic","control_group":"Revenue","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023de5dab265a','2024051712d5a7c8b9e0','{"id":"ebe346f9-efe2-49ed-a14b-3a0eff0b169e","account_number":"4900","account_name":"Other Revenue","control_group":"Revenue","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023c88416a3f9','2024051712d5a7c8b9e0','{"id":"541a7ba1-aea5-4fa4-910c-5054df480b0b","account_number":"4999","account_name":"Uncategorized Income","control_group":"Revenue","type":"P&L"}');

-- COGS
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712bb1c45b9bb','COGS','cost of good and services','{"id":"6fa459ea-ee8a-3ca4-894e-db77e160355e","name":"COGS","description":"COGS Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Cost of Goods Sold","type":"object","properties":{"cogs":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the COGS entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."},"amount":{"type":"number","description":"Amount associated with this account in the COGS."}},"required":["id","account_id","account_name","type","control_group","amount"]}}},"required":["cogs"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712a7b8c9d4a7','2024051712bb1c45b9bb','{"id":"b34bf854-c5db-49e3-ae3f-40d78998d957","account_number":"5100","account_name":"Employee Cost","control_group":"COGS","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712e4f5d6c7e4','2024051712bb1c45b9bb','{"id":"8d4aab76-9816-4b4a-8037-38d5f1f23b69","account_number":"5200","account_name":"Contractors COGS (1099s)","control_group":"COGS","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('202405171267e89a8d67','2024051712bb1c45b9bb','{"id":"afe1b43b-49b0-4d2c-8fd7-7b7611f0e127","account_number":"5300","account_name":"Travel COGS","control_group":"COGS","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('202405171259b9fa7e8c','2024051712bb1c45b9bb','{"id":"a3bb189e-8bf9-3888-9912-ace4e6543002","account_number":"5600","account_name":"Infrastructure Technology (Hosting & Other Subscriptions)","control_group":"COGS","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712a93d0af8e1','2024051712bb1c45b9bb','{"id":"3e0a2d6a-e69b-4b9a-8c7e-45f15d56de13","account_number":"5900","account_name":"Other COGS","control_group":"COGS","type":"P&L"}');

-- OPEX
INSERT INTO types (id, name, description, attributes) VALUES ('202405171217f5b6a217','OPEX','operating expense','{"id":"123e4567-e89b-12d3-a456-426614174000","name":"OPEX","description":"OPEX Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Operating Expenses","type":"object","properties":{"opex":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the OPEX entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."},"amount":{"type":"number","description":"Amount associated with this account in the OPEX."}},"required":["id","account_id","account_name","type","control_group","amount"]}}},"required":["opex"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712c7f1b28c16','202405171217f5b6a217','{"id":"dc6807f1-1aaf-44bc-b3a8-9e540b805c36","account_number":"6100","account_name":"Employee Cost OPEX (W2s) - Generic","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712fd87c1214e','202405171217f5b6a217','{"id":"9d5b51c5-158b-4b12-81e7-8b9c9dbaac3e","account_number":"6200","account_name":"Professional Services (1099s) - Generic","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517128493f5b6c9','202405171217f5b6a217','{"id":"e7a1f3b7-d86c-499a-a64a-4d16ab1f9f4e","account_number":"6300","account_name":"Travel & Entertainment - Generic","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712b1d0e372af','202405171217f5b6a217','{"id":"de7fdd41-79b6-4c02-8a4e-44b845f92f0a","account_number":"6400","account_name":"Marketing - Generic (Non People Cost)","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240517124e1b62a1c4','202405171217f5b6a217','{"id":"f4e1e0f5-6e2d-4b8c-9ab8-df9a446fe1e5","account_number":"6600","account_name":"Technology Infrastructure OPEX","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712d9c3e2a5b7','202405171217f5b6a217','{"id":"c6c9f410-1d59-4147-b6ab-abc674a8c9e3","account_number":"6700","account_name":"Legal - Generic (Non People Cost)","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712a6b9d3f2c4','202405171217f5b6a217','{"id":"bd563da7-94b3-40d5-a3d0-11cb9984f6d1","account_number":"6800","account_name":"Occupancy Expense","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712f7c2b8a1e9','202405171217f5b6a217','{"id":"acf62c65-5469-4d5f-8d0f-146c44b2f6c2","account_number":"6870","account_name":"Bank fees & charges","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712c8d1a6b9e0','202405171217f5b6a217','{"id":"eb19e7a3-3c75-4694-89ab-14e4d6fa89c4","account_number":"6990","account_name":"Depreciation (OPEX)","control_group":"OPEX","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024051712e7b5a2c4d9','202405171217f5b6a217','{"id":"56b67c21-9e83-4b38-8e0b-f59a6c574c98","account_number":"6900","account_name":"Other G&A","control_group":"OPEX","type":"P&L"}');


-- Non op Income
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712d9b2a1f7e6','7 - Non Op Income','None Operating Income from P&L','{"id":"b8d6f3c1-7883-4af1-b0a6-6c8c6584e08d","name":"Non Op Income","description":"Non Op Income Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Non Op Income","type":"object","properties":{"non_op_income":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the non-operating income entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["non_op_income"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023f40323ca3b','2024051712d9b2a1f7e6','{"id":"188d92c7-7c40-4c7d-884f-ad9dfca4b0ff","account_number":"7900","account_name":"Other Non Op Income","control_group":"Non Op Income","type":"P&L"}');


-- Non Op Expense
INSERT INTO types (id, name, description, attributes) VALUES ('2024051712a3f4c5b6d8','8 - Non Op Expense','None Operating Expense from P&L','{"id":"2e1f2f65-87b3-4a75-b6af-4680cbfb749e","name":"Non Op Expense","description":"Non Op Expense Schema","schema":{"$schema":"http://json-schema.org/draft-07/schema#","title":"Non Op Expense","type":"object","properties":{"non_op_expense":{"type":"array","items":{"type":"object","properties":{"id":{"type":"string","description":"Unique identifier for the non-operating expense entry."},"account_id":{"type":"string","description":"Unique identifier for the account."},"account_name":{"type":"string","description":"Name of the account."},"type":{"type":"string","enum":["Balance Sheet","P&L"],"description":"Indicates whether the account is related to the Balance Sheet or P&L."},"control_group":{"type":"string","enum":["Assets - Current","Assets - Long Term","Liabilities - Current","Liabilities - Long Term","Equity","Revenue","COGS","OPEX","Non Op Income","Non Op Expense"],"description":"Control group to which the account belongs."}},"required":["id","account_id","account_name","type","control_group"]}}},"required":["non_op_expense"]}}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('20240520234caa32b7fa','2024051712a3f4c5b6d8','{"id":"13a9725f-adde-4291-8fe3-cd22bd49ec4c","account_number":"8970","account_name":"Startup Cost","control_group":"Non Op Expense","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023156d1f98ad','2024051712a3f4c5b6d8','{"id":"c5bb29c4-bd8e-4740-bc0a-4bf42d3733d7","account_number":"8990","account_name":"Other Non Op Expense","control_group":"Non Op Expense","type":"P&L"}');
INSERT INTO financial_entities (id, entity_type, attributes) VALUES ('2024052023511275a7ac','2024051712a3f4c5b6d8','{"id":"8cfb497e-4dc9-4a44-a8b2-30af7fd1d67a","account_number":"9000","account_name":"Corporate Tax","control_group":"Non Op Expense","type":"P&L"}');


-- CREATE TABLE financial_entities (
--     id VARCHAR(20) PRIMARY KEY,
--     attributes JSONB NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     entity_type INT REFERENCES types(id),
-- );



-- CREATE TABLE financial_relationships (
--     id VARCHAR(20) PRIMARY KEY,
--     node1_id INT REFERENCES financial_entities(id),
--     node2_id INT REFERENCES financial_entities(id),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     attributes JSONB NOT NULL
-- );

-- CREATE TABLE cross_relationships (
--     id VARCHAR(20) PRIMARY KEY,
--     node1_id INT REFERENCES financial_entities(id),
--     node2_id INT REFERENCES operational_entities(id),
--     attributes JSONB NOT NULL
-- );


CREATE TABLE scenarios (
    id VARCHAR(20) PRIMARY KEY,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    version INT NOT NULL,
    changes JSONB NOT NULL
);

CREATE INDEX idx_operational_entities_id ON operational_entities(id);
CREATE INDEX idx_financial_entities_id ON financial_entities(id);
CREATE INDEX idx_types_type_name ON types(type_name);
CREATE INDEX idx_activities_id ON activities(id);
CREATE INDEX idx_activities_operational_entity_id ON activities(operational_entity_id);
CREATE INDEX idx_activities_financial_entity_id ON activities(financial_entity_id);
CREATE INDEX idx_scenarios_id ON scenarios(id);
CREATE INDEX idx_scenarios_changes ON scenarios USING gin (changes);


-- schema validation
CREATE OR REPLACE FUNCTION validate_scenario_changes()
RETURNS TRIGGER AS $$
DECLARE
    item JSONB;
BEGIN
    FOR item IN SELECT * FROM jsonb_array_elements(NEW.changes)
    LOOP
        -- Validate Operational Entity
        PERFORM 1 FROM operational_entities WHERE id = (item->>'operational_entity_id')::INT;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Operational entity ID % not found', item->>'operational_entity_id';
        END IF;

        -- Validate Financial Entity
        PERFORM 1 FROM financial_entities WHERE id = (item->>'financial_entity_id')::INT;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Financial entity ID % not found', item->>'financial_entity_id';
        END IF;

        -- Validate Type in Attributes
        IF item->'attributes' ? 'type' THEN
            PERFORM 1 FROM types WHERE type_name = item->'attributes'->>'type';
            IF NOT FOUND THEN
                RAISE EXCEPTION 'Type % not found in types table', item->'attributes'->>'type';
            END IF;
        END IF;

        -- Additional validation for specific scenarios
        IF (item->'attributes'->>'magnitude')::FLOAT > 10 THEN
            IF item->'attributes'->>'type' IS DISTINCT FROM 'special_type' THEN
                RAISE EXCEPTION 'For magnitudes > 10, type must be special_type';
            END IF;
        END IF;

        IF item->'attributes' ? 'additional_salary' THEN
            IF (item->'attributes'->>'additional_salary')::INT <= 0 THEN
                RAISE EXCEPTION 'Additional salary must be greater than 0';
            END IF;
        END IF;
    END LOOP;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- trigger for validation
CREATE TRIGGER validate_scenario_changes_trigger
BEFORE INSERT OR UPDATE ON scenarios
FOR EACH ROW
EXECUTE FUNCTION validate_scenario_changes();


-- materialized view for improve read performance
CREATE MATERIALIZED VIEW activity_summary AS
SELECT 
    a.id AS activity_id,
    oe.name AS operational_entity_name,
    fe.name AS financial_entity_name,
    a.attributes
FROM 
    activities a
JOIN 
    operational_entities oe ON a.operational_entity_id = oe.id
JOIN 
    financial_entities fe ON a.financial_entity_id = fe.id;

--  refreshing materialized view 
CREATE OR REPLACE FUNCTION refresh_activity_summary()
RETURNS VOID AS $$
BEGIN
    REFRESH MATERIALIZED VIEW activity_summary;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER refresh_activity_summary_trigger
AFTER INSERT OR UPDATE OR DELETE ON activities
FOR EACH STATEMENT
EXECUTE FUNCTION refresh_activity_summary();


-- Insert into operational_entities
INSERT INTO operational_entities (id,name, description, attributes) VALUES ('2024051712d2d2d2d2d2','Employee','Individuals working for the company','{"id":"f47ac10b-58cc-4372-a567-0e02b2c3d479","name":"Employee","description":"Individuals working for the company","relationships":[{"activity":[9]}]}');


-- Insert into financial_entities
INSERT INTO financial_entities (name, description) VALUES ('Salary', 'Financial entity representing salaries');
INSERT INTO financial_entities (name, description) VALUES ('Budget', 'Financial entity representing budget');
{"name":"Employee","description":"Individuals working for the company","type":2,"relationships":[{"department":[4]},{"activity":[9]}]}


-- Insert into activities
INSERT INTO activities (operational_entity_id, financial_entity_id, attributes) VALUES 
(1, 1, '{"id":"895dfdd2-b547-4f2c-bb7e-48f8e5a8f5ad","name":"Employee Activvity","description":"Impact of employees on financial","relationships":[{"cogs":[12],"opex":[13]}],"magnitude":1.0}'),
(1, 1, '{"magnitude": 10, "additional_salary": 60000, "type": "new_hires"}'),
(2, 2, '{"magnitude": 1, "new_location": "Los Angeles", "type": "office_opening"}');

-- Insert into scenarios
INSERT INTO scenarios (id, description, changes) VALUES 

--  magnitude should be an object
('id4','Engineering Expantion Scenario', '[
    {"id":"id1", "description": "Increase Engineering salary by 10%", "attributes": {"magnitude": 1.1, "type": "salary_increase"}},
    {"id":"id2", "description": "Add 10 New Sales Agents","attributes": {"magnitude": 10, "additional_salary": 60000, "type": "new_hires"}},
    {"id":"id3", "description": "Open new office in LA","attributes": {"magnitude": 1, "new_location": "Los Angeles", "type": "office_opening"}}
]');
